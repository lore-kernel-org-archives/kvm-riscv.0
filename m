From: Maciej S. Szmigiero <maciej.szmigiero@oracle.com>
Date: Tue, 9 Nov 2021 01:39:15 +0100
Subject: [PATCH v5.5 06/30] KVM: Use "new" memslot's address space ID
 instead of dedicated param
In-Reply-To: <20211104002531.1176691-7-seanjc@google.com>
References: <20211104002531.1176691-1-seanjc@google.com>
 <20211104002531.1176691-7-seanjc@google.com>
Message-ID: <eab8516c-eaf3-263f-d512-e7ac585ecab8@oracle.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 04.11.2021 01:25, Sean Christopherson wrote:
> Now that the address space ID is stored in every slot, including fake
> slots used for deletion, use the slot's as_id instead of passing in the
> redundant information as a param to kvm_set_memslot().  This will greatly
> simplify future memslot work by avoiding passing a large number of
> variables around purely to honor @as_id.
> 
> Drop a comment in the DELETE path about new->as_id being provided purely
> for debug, as that's now a lie.
> 
> No functional change intended.
> 
> Signed-off-by: Sean Christopherson <seanjc@google.com>

Reviewed-by: Maciej S. Szmigiero <maciej.szmigiero@oracle.com>

