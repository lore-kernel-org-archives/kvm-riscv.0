From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 19 May 2021 13:17:04 +0300
Subject: [PATCH v18 02/18] RISC-V: Add initial skeletal KVM support
In-Reply-To: <20210519033553.1110536-3-anup.patel@wdc.com>
References: <20210519033553.1110536-1-anup.patel@wdc.com>
 <20210519033553.1110536-3-anup.patel@wdc.com>
Message-ID: <20210519101704.GT1955@kadam>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, May 19, 2021 at 09:05:37AM +0530, Anup Patel wrote:
> +void kvm_riscv_stage2_free_pgd(struct kvm *kvm)
> +{
> +	/* TODO: */
> +}
> +

I was disappointed how many stub functions remained at the end of the
patchset...  It's better to not publish those.  How useful is this
patchset with the functionality that is implemented currently?

> +int kvm_arch_init_vm(struct kvm *kvm, unsigned long type)
> +{
> +	int r;
> +
> +	r = kvm_riscv_stage2_alloc_pgd(kvm);
> +	if (r)
> +		return r;
> +
> +	return 0;
> +}

Half the code uses "int ret;" and half uses "int r;".  Make everything
int ret.

regards,
dan carpenter

