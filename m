From: Xu, Haibo1 <haibo1.xu@intel.com>
Date: Fri, 8 Dec 2023 01:20:36 +0000
Subject: [PATCH] KVM: riscv: selftests: Fix get-reg-list print_reg
 defaults
In-Reply-To: <20231207134012.20428-2-ajones@ventanamicro.com>
References: <20231207134012.20428-2-ajones@ventanamicro.com>
Message-ID: <BY5PR11MB3909674E6416D9DE1D492AEBB08AA@BY5PR11MB3909.namprd11.prod.outlook.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

> -----Original Message-----
> From: Andrew Jones <ajones@ventanamicro.com>
> Sent: Thursday, December 7, 2023 9:40 PM
> To: kvm-riscv at lists.infradead.org
> Cc: anup at brainfault.org; Xu, Haibo1 <haibo1.xu@intel.com>
> Subject: [PATCH] KVM: riscv: selftests: Fix get-reg-list print_reg defaults
> 
> print_reg() will print everything it knows when it encounters a register ID it's
> unfamiliar with in the default cases of its decoding switches. Fix several issues
> with these (until now, never tested) paths; missing newlines in printfs, missing
> complement operator in mask, and missing return in order to avoid continuing
> to decode.
> 
> Fixes: 62d0c458f828 ("KVM: riscv: selftests: get-reg-list print_reg should never
> fail")
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>  tools/testing/selftests/kvm/riscv/get-reg-list.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/tools/testing/selftests/kvm/riscv/get-reg-list.c
> b/tools/testing/selftests/kvm/riscv/get-reg-list.c
> index 6bedaea95395..25de4b8bc347 100644
> --- a/tools/testing/selftests/kvm/riscv/get-reg-list.c
> +++ b/tools/testing/selftests/kvm/riscv/get-reg-list.c
> @@ -458,8 +458,9 @@ void print_reg(const char *prefix, __u64 id)
>  		reg_size = "KVM_REG_SIZE_U128";
>  		break;
>  	default:
> -		printf("\tKVM_REG_RISCV | (%lld << KVM_REG_SIZE_SHIFT) |
> 0x%llx /* UNKNOWN */,",
> -		       (id & KVM_REG_SIZE_MASK) >> KVM_REG_SIZE_SHIFT, id &
> REG_MASK);
> +		printf("\tKVM_REG_RISCV | (%lld << KVM_REG_SIZE_SHIFT) |
> 0x%llx /* UNKNOWN */,\n",
> +		       (id & KVM_REG_SIZE_MASK) >> KVM_REG_SIZE_SHIFT, id &
> ~REG_MASK);
> +		return;
>  	}
> 
>  	switch (id & KVM_REG_RISCV_TYPE_MASK) { @@ -496,8 +497,9 @@
> void print_reg(const char *prefix, __u64 id)
>  				reg_size, sbi_ext_id_to_str(prefix, id));
>  		break;
>  	default:
> -		printf("\tKVM_REG_RISCV | %s | 0x%llx /* UNKNOWN */,",
> -				reg_size, id & REG_MASK);
> +		printf("\tKVM_REG_RISCV | %s | 0x%llx /* UNKNOWN */,\n",
> +				reg_size, id & ~REG_MASK);
> +		return;
>  	}
>  }
> 

LGTM!

Reviewed-by: Haibo Xu <haibo1.xu@intel.com>
 
> --
> 2.43.0


