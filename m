From: Rob Herring <robh@kernel.org>
Date: Fri, 16 Feb 2024 20:33:35 -0600
Subject: [PATCH RFC 08/20] dt-bindings: riscv: add Ssccfg ISA extension
 description
In-Reply-To: <20240217005738.3744121-9-atishp@rivosinc.com>
References: <20240217005738.3744121-1-atishp@rivosinc.com>
 <20240217005738.3744121-9-atishp@rivosinc.com>
Message-ID: <170813721337.1034359.14079032178586114678.robh@kernel.org>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit


On Fri, 16 Feb 2024 16:57:26 -0800, Atish Patra wrote:
> Add description for the Ssccfg extension.
> 
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  .../devicetree/bindings/riscv/extensions.yaml       | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:
./Documentation/devicetree/bindings/riscv/extensions.yaml:131:1: [error] syntax error: found character '\t' that cannot start any token (syntax)

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/riscv/extensions.yaml:131:1: found a tab character where an indentation space is expected
./Documentation/devicetree/bindings/riscv/extensions.yaml:131:1: found a tab character where an indentation space is expected
  in "<unicode string>", line 125, column 24
  in "<unicode string>", line 131, column 1

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240217005738.3744121-9-atishp at rivosinc.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


