From: Maciej S. Szmigiero <maciej.szmigiero@oracle.com>
Date: Tue, 9 Nov 2021 01:40:57 +0100
Subject: [PATCH v5.5 16/30] KVM: x86: Don't assume old/new memslots are
 non-NULL at memslot commit
In-Reply-To: <20211104002531.1176691-17-seanjc@google.com>
References: <20211104002531.1176691-1-seanjc@google.com>
 <20211104002531.1176691-17-seanjc@google.com>
Message-ID: <623f2d6e-6f75-03a9-2932-61190eebd30a@oracle.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 04.11.2021 01:25, Sean Christopherson wrote:
> Play nice with a NULL @old or @new when handling memslot updates so that
> common KVM can pass NULL for one or the other in CREATE and DELETE cases
> instead of having to synthesize a dummy memslot.
> 
> No functional change intended.
> 
> Signed-off-by: Sean Christopherson <seanjc@google.com>

Reviewed-by: Maciej S. Szmigiero <maciej.szmigiero@oracle.com>

