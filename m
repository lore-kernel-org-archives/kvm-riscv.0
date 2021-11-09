From: Maciej S. Szmigiero <maciej.szmigiero@oracle.com>
Date: Tue, 9 Nov 2021 01:41:09 +0100
Subject: [PATCH v5.5 18/30] KVM: Don't make a full copy of the old memslot
 in __kvm_set_memory_region()
In-Reply-To: <20211104002531.1176691-19-seanjc@google.com>
References: <20211104002531.1176691-1-seanjc@google.com>
 <20211104002531.1176691-19-seanjc@google.com>
Message-ID: <829b0c0b-7735-51d7-3728-b8fd1d54e92d@oracle.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 04.11.2021 01:25, Sean Christopherson wrote:
> Stop making a full copy of the old memslot in __kvm_set_memory_region()
> now that metadata updates are handled by kvm_set_memslot(), i.e. now that
> the old memslot's dirty bitmap doesn't need to be referenced after the
> memslot and its pointer is modified/invalidated by kvm_set_memslot().
> 
> No functional change intended.
> 
> Signed-off-by: Sean Christopherson <seanjc@google.com>

Reviewed-by: Maciej S. Szmigiero <maciej.szmigiero@oracle.com>

