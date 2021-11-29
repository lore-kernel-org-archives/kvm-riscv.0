From: David Woodhouse <dwmw2@infradead.org>
Date: Mon, 29 Nov 2021 16:44:52 +0000
Subject: [PATCH v5 05/12] KVM: RISC-V: Use Makefile.kvm for common files
In-Reply-To: <CAAhSdy307DqNuQEFCu2ze2jXJ7taDE6y6SwY9nHGA8yNPfggiQ@mail.gmail.com>
References: <20211121125451.9489-1-dwmw2@infradead.org>
 <20211121125451.9489-6-dwmw2@infradead.org>
 <CAAhSdy307DqNuQEFCu2ze2jXJ7taDE6y6SwY9nHGA8yNPfggiQ@mail.gmail.com>
Message-ID: <69e6187506ee1ddd177c364be3162546afa74f85.camel@infradead.org>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, 2021-11-23 at 14:42 +0530, Anup Patel wrote:
> On Sun, Nov 21, 2021 at 6:25 PM David Woodhouse <dwmw2@infradead.org> wrote:
> 
> > From: David Woodhouse <dwmw@amazon.co.uk>
> > Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> 
> Looks good to me.
> 
> For KVM RISC-V,
> 
> Acked-by: Anup Patel <anup.patel@wdc.com>
> Reviewed-by: Anup Patel <anup.patel@wdc.com>

Thanks. I've included those in the tree at
https://git.infradead.org/users/dwmw2/linux.git/shortlog/refs/heads/xen-evtchn
which is based on kvm/master but rebases cleanly to kvm/queue.

I'm working on additional support (IPI, timers, etc.) to go on top but
will post that in a separate series rather than adding more to this
one.
-------------- next part --------------
A non-text attachment was scrubbed...
Name: smime.p7s
Type: application/pkcs7-signature
Size: 5174 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/kvm-riscv/attachments/20211129/9889c77d/attachment.p7s>
