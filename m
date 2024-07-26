From: Clément Léger <cleger@rivosinc.com>
Date: Fri, 26 Jul 2024 11:04:35 +0200
Subject: [PATCH v8 4/5] KVM: riscv: selftests: Fix compile error
In-Reply-To: <20240726084931.28924-5-yongxuan.wang@sifive.com>
References: <20240726084931.28924-1-yongxuan.wang@sifive.com>
 <20240726084931.28924-5-yongxuan.wang@sifive.com>
Message-ID: <f65d5184-d397-46ce-b8ba-dfe2d3a5ad40@rivosinc.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On 26/07/2024 10:49, Yong-Xuan Wang wrote:
> Fix compile error introduced by commit d27c34a73514 ("KVM: riscv:
> selftests: Add some Zc* extensions to get-reg-list test"). These
> 4 lines should be end with ";".
> 
> Fixes: d27c34a73514 ("KVM: riscv: selftests: Add some Zc* extensions to get-reg-list test")
> Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
> ---
>  tools/testing/selftests/kvm/riscv/get-reg-list.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/tools/testing/selftests/kvm/riscv/get-reg-list.c b/tools/testing/selftests/kvm/riscv/get-reg-list.c
> index f92c2fb23fcd..8e34f7fa44e9 100644
> --- a/tools/testing/selftests/kvm/riscv/get-reg-list.c
> +++ b/tools/testing/selftests/kvm/riscv/get-reg-list.c
> @@ -961,10 +961,10 @@ KVM_ISA_EXT_SIMPLE_CONFIG(zbkb, ZBKB);
>  KVM_ISA_EXT_SIMPLE_CONFIG(zbkc, ZBKC);
>  KVM_ISA_EXT_SIMPLE_CONFIG(zbkx, ZBKX);
>  KVM_ISA_EXT_SIMPLE_CONFIG(zbs, ZBS);
> -KVM_ISA_EXT_SIMPLE_CONFIG(zca, ZCA),
> -KVM_ISA_EXT_SIMPLE_CONFIG(zcb, ZCB),
> -KVM_ISA_EXT_SIMPLE_CONFIG(zcd, ZCD),
> -KVM_ISA_EXT_SIMPLE_CONFIG(zcf, ZCF),
> +KVM_ISA_EXT_SIMPLE_CONFIG(zca, ZCA);
> +KVM_ISA_EXT_SIMPLE_CONFIG(zcb, ZCB);
> +KVM_ISA_EXT_SIMPLE_CONFIG(zcd, ZCD);
> +KVM_ISA_EXT_SIMPLE_CONFIG(zcf, ZCF);
>  KVM_ISA_EXT_SIMPLE_CONFIG(zcmop, ZCMOP);
>  KVM_ISA_EXT_SIMPLE_CONFIG(zfa, ZFA);
>  KVM_ISA_EXT_SIMPLE_CONFIG(zfh, ZFH);

Arg, my bad. Thanks for fixing that.

Reviewed-by: Cl?ment L?ger <cleger@rivosinc.com>

Thanks,

Cl?ment

