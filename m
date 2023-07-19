From: Jarkko Sakkinen <jarkko@kernel.org>
Date: Wed, 19 Jul 2023 16:39:23 +0300
Subject: [RFC PATCH v11 01/29] KVM: Wrap kvm_gfn_range.pte in a
 per-action union
In-Reply-To: <20230718234512.1690985-2-seanjc@google.com>
References: <20230718234512.1690985-1-seanjc@google.com>
 <20230718234512.1690985-2-seanjc@google.com>
Message-ID: <CU66VMG4IKSD.33KF2CEZJ2I1@suppilovahvero>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed Jul 19, 2023 at 2:44 AM EEST, Sean Christopherson wrote:
>  	/* Huge pages aren't expected to be modified without first being zapped. */
> -	WARN_ON(pte_huge(range->pte) || range->start + 1 != range->end);
> +	WARN_ON(pte_huge(range->arg.pte) || range->start + 1 != range->end);

Not familiar with this code. Just checking whether whether instead
pr_{warn,err}() combined with return false would be a more graceful
option?

BR, Jarkko

