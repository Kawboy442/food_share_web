$(function() {
        var s3_client = function() {
            AWS.config.region = "us-east-1";
            AWS.config.credentials = new AWS.CognitoIdentityCredentials({
                IdentityPoolId: "us-east-1:074228e7-6d1b-4221-9673-d2b62afbde09"
            });
            AWS.config.credentials.get(function(err) {
                if (!err) {
                    console.log("Cognito Identify Id: " + AWS.config.credentials.identityId);
                }
            });
            return new AWS.S3({
                params: {
                    Bucket: "foodshareweb"
                }
            });
        };
        $("#apply-upload").click(function() {
            var file = $("#upload-file").prop("files")[0];
            var timestamp = new Date().getTime();
            var filename = "file" + timestamp + ".jpg";
            s3_client().putObject({
                Key: filename,
                ContentType: file.type,
                Body: file,
                ACL: "public-read"
            }, function(err, data) {
                // if failed, alert
                if (data !== null) {
                    alert("アップロード成功!");
                } else {
                    alert("アップロード失敗.");
                }
            });
        });
    )
};