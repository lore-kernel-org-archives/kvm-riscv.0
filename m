From: Maciej S. Szmigiero <maciej.szmigiero@oracle.com>
Date: Tue, 9 Nov 2021 01:38:36 +0100
Subject: [PATCH v5.5 04/30] KVM: Open code kvm_delete_memslot() into its
 only caller
In-Reply-To: <20211104002531.1176691-5-seanjc@google.com>
References: <20211104002531.1176691-1-seanjc@google.com>
 <20211104002531.1176691-5-seanjc@google.com>
Message-ID: <94ce4359-a87b-cbb1-0d47-acc5257d97b6@oracle.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 04.11.2021 01:25, Sean Christopherson wrote:
> Fold kvm_delete_memslot() into __kvm_set_memory_region() to free up the
> "kvm_delete_memslot()" name for use in a future helper.  The delete logic
> isn't so complex/long that it truly needs a helper, and it will be
> simplified a wee bit further in upcoming commits.
> 
> No functional change intended.
> 
> Signed-off-by: Sean Christopherson <seanjc@google.com>

Reviewed-by: Maciej S. Szmigiero <maciej.szmigiero@oracle.com>

