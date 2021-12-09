From: Paolo Bonzini <pbonzini@redhat.com>
Date: Thu, 9 Dec 2021 19:55:52 +0100
Subject: [PATCH v5 00/12] KVM: x86/xen: Add in-kernel Xen event channel
 delivery
In-Reply-To: <5706a7fec0ffdb18097792374dad90c0400b17cd.camel@infradead.org>
References: <20211121125451.9489-1-dwmw2@infradead.org>
 <2617aea0-af09-5c0d-1fd7-65e2a814b516@redhat.com>
 <5706a7fec0ffdb18097792374dad90c0400b17cd.camel@infradead.org>
Message-ID: <68d867c7-1031-00be-e28d-bd435d9c4170@redhat.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 12/9/21 19:47, David Woodhouse wrote:
>>> As in the previous two rounds, the last patch (this time patch 12) is
>>> included as illustration of how we*might*  use this for fixing the UAF
>>> bugs in nesting, but isn't intended to be applied as-is. Patches 1-11 are.
>> Queued 1-7, will be on kvm/next tomorrow though.
>
> Thanks. I assume you made the changes you wanted to the makefiles then,
> and will work on the gfn_to_pfn_cache changes you suggested.

Yes, thanks.

Paolo

