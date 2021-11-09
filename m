From: Sean Christopherson <seanjc@google.com>
Date: Tue, 9 Nov 2021 01:21:07 +0000
Subject: [PATCH v5.5 00/30] KVM: Scalable memslots implementation
In-Reply-To: <cb4f5d6e-9535-dd57-d8ee-3b593a81f3a6@oracle.com>
References: <20211104002531.1176691-1-seanjc@google.com>
 <cb4f5d6e-9535-dd57-d8ee-3b593a81f3a6@oracle.com>
Message-ID: <YYnNA5lZNXXdX/ig@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Nov 09, 2021, Maciej S. Szmigiero wrote:
> On 04.11.2021 01:25, Sean Christopherson wrote:
> By the way, do you want your patches and my non-invasive patches (patches
> below number 23) merged without waiting for the rest of the series to be
> fully ready?
> 
> This way there is less risk of conflicting changes to KVM being merged
> in meantime while we are still discussing the remaining patches.
> Or worse - changes that don't conflict but subtly break some assumptions
> that the code relies on.
> 
> For this reason I am strongly for merging them independently from the
> more invasive parts.

Merging them as soon as they're ready would also be my preference.  That said,
I'm hoping we can get the entire implemenation queued up for 5.17 sooner than
later.  I'll do my best to respond quickly to try and make that happen.

