From: David Woodhouse <dwmw2@infradead.org>
Date: Thu, 09 Dec 2021 18:47:52 +0000
Subject: [PATCH v5 00/12] KVM: x86/xen: Add in-kernel Xen event channel
 delivery
In-Reply-To: <2617aea0-af09-5c0d-1fd7-65e2a814b516@redhat.com>
References: <20211121125451.9489-1-dwmw2@infradead.org>
 <2617aea0-af09-5c0d-1fd7-65e2a814b516@redhat.com>
Message-ID: <5706a7fec0ffdb18097792374dad90c0400b17cd.camel@infradead.org>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, 2021-12-09 at 19:34 +0100, Paolo Bonzini wrote:
> > As in the previous two rounds, the last patch (this time patch 12) is
> > included as illustration of how we*might*  use this for fixing the UAF
> > bugs in nesting, but isn't intended to be applied as-is. Patches 1-11 are.
> 
> Queued 1-7, will be on kvm/next tomorrow though.

Thanks. I assume you made the changes you wanted to the makefiles then,
and will work on the gfn_to_pfn_cache changes you suggested.



-------------- next part --------------
A non-text attachment was scrubbed...
Name: smime.p7s
Type: application/pkcs7-signature
Size: 5174 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/kvm-riscv/attachments/20211209/e0377cf4/attachment-0001.p7s>
