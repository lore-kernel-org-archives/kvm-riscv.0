From: Maciej S. Szmigiero <maciej.szmigiero@oracle.com>
Date: Tue, 9 Nov 2021 01:40:49 +0100
Subject: [PATCH v5.5 15/30] KVM: Use prepare/commit hooks to handle
 generic memslot metadata updates
In-Reply-To: <20211104002531.1176691-16-seanjc@google.com>
References: <20211104002531.1176691-1-seanjc@google.com>
 <20211104002531.1176691-16-seanjc@google.com>
Message-ID: <84daccb5-9eec-011d-a0f7-a6af38a124da@oracle.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 04.11.2021 01:25, Sean Christopherson wrote:
> Handle the generic memslot metadata, a.k.a. dirty bitmap, updates at the
> same time that arch handles it's own metadata updates, i.e. at memslot
> prepare and commit.  This will simplify converting @new to a dynamically
> allocated object, and more closely aligns common KVM with architecture
> code.
> 
> No functional change intended.
> 
> Signed-off-by: Sean Christopherson <seanjc@google.com>

Reviewed-by: Maciej S. Szmigiero <maciej.szmigiero@oracle.com>

