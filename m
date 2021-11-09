From: Maciej S. Szmigiero <maciej.szmigiero@oracle.com>
Date: Tue, 9 Nov 2021 01:40:37 +0100
Subject: [PATCH v5.5 14/30] KVM: Stop passing kvm_userspace_memory_region
 to arch memslot hooks
In-Reply-To: <20211104002531.1176691-15-seanjc@google.com>
References: <20211104002531.1176691-1-seanjc@google.com>
 <20211104002531.1176691-15-seanjc@google.com>
Message-ID: <d7ef0c04-dfc4-17d7-d0a5-3e91e43ed8c8@oracle.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 04.11.2021 01:25, Sean Christopherson wrote:
> Drop the @mem param from kvm_arch_{prepare,commit}_memory_region() now
> that its use has been removed in all architectures.
> 
> No functional change intended.
> 
> Signed-off-by: Sean Christopherson <seanjc@google.com>

Reviewed-by: Maciej S. Szmigiero <maciej.szmigiero@oracle.com>

