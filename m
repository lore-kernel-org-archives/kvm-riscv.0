From: Paolo Bonzini <pbonzini@redhat.com>
Date: Wed, 19 Jul 2023 18:55:25 +0200
Subject: [RFC PATCH v11 01/29] KVM: Wrap kvm_gfn_range.pte in a per-action
 union
In-Reply-To: <20230718234512.1690985-2-seanjc@google.com>
References: <20230718234512.1690985-1-seanjc@google.com>
 <20230718234512.1690985-2-seanjc@google.com>
Message-ID: <711f74d6-fe15-6bd4-a9b9-c4f178d95bf3@redhat.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 7/19/23 01:44, Sean Christopherson wrote:
> +	BUILD_BUG_ON(sizeof(gfn_range.arg) != sizeof(gfn_range.arg.raw));
> +	BUILD_BUG_ON(sizeof(range->arg) != sizeof(range->arg.raw));

I think these should be static assertions near the definition of the 
structs.  However another possibility is to remove 'raw' and just assign 
the whole union.

Apart from this,

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>

Paolo

> +	BUILD_BUG_ON(sizeof(gfn_range.arg) != sizeof(range->arg));



