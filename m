From: Maciej S. Szmigiero <maciej.szmigiero@oracle.com>
Date: Fri, 12 Nov 2021 00:52:47 +0100
Subject: [PATCH v5.5 29/30] KVM: Wait 'til the bitter end to initialize
 the "new" memslot
In-Reply-To: <20211104002531.1176691-30-seanjc@google.com>
References: <20211104002531.1176691-1-seanjc@google.com>
 <20211104002531.1176691-30-seanjc@google.com>
Message-ID: <676299e2-a59b-2af0-7e6a-b2b47b7765e0@oracle.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 04.11.2021 01:25, Sean Christopherson wrote:
> Initialize the "new" memslot in the !DELETE path only after the various
> sanity checks have passed.  This will allow a future commit to allocate
> @new dynamically without having to copy a memslot, and without having to
> deal with freeing @new in error paths and in the "nothing to change" path
> that's hiding in the sanity checks.
> 
> No functional change intended.
> 
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---

Reviewed-by: Maciej S. Szmigiero <maciej.szmigiero@oracle.com>

