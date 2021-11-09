From: Maciej S. Szmigiero <maciej.szmigiero@oracle.com>
Date: Tue, 9 Nov 2021 01:40:26 +0100
Subject: [PATCH v5.5 12/30] KVM: x86: Use "new" memslot instead of
 userspace memory region
In-Reply-To: <20211104002531.1176691-13-seanjc@google.com>
References: <20211104002531.1176691-1-seanjc@google.com>
 <20211104002531.1176691-13-seanjc@google.com>
Message-ID: <14c14a1d-6ddb-e2b4-c71d-808af552bb30@oracle.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 04.11.2021 01:25, Sean Christopherson wrote:
> Get the number of pages directly from the new memslot instead of
> computing the same from the userspace memory region when allocating
> memslot metadata.  This will allow a future patch to drop @mem.
> 
> No functional change intended.
> 
> Signed-off-by: Sean Christopherson <seanjc@google.com>

Reviewed-by: Maciej S. Szmigiero <maciej.szmigiero@oracle.com>

