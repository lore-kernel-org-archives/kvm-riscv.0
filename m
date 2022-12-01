From: Robert Hoo <robert.hu@linux.intel.com>
Date: Thu, 01 Dec 2022 09:34:37 +0800
Subject: [PATCH 32/44] KVM: x86: Unify pr_fmt to use module name for all
 KVM modules
In-Reply-To: <Y4fg+MO2DusqMSZO@google.com>
References: <20221102231911.3107438-1-seanjc@google.com>
	 <20221102231911.3107438-33-seanjc@google.com>
	 <ff0e8701d02ee161d064f92c8b742c2cc061bce0.camel@linux.intel.com>
	 <Y20r2NR9MaBbOGLn@google.com> <Y4fg+MO2DusqMSZO@google.com>
Message-ID: <ceb3bb1e98a3933c3bf34641d731c69b67d761b4.camel@linux.intel.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, 2022-11-30 at 23:02 +0000, Sean Christopherson wrote:
> On Thu, Nov 10, 2022, Sean Christopherson wrote:
> > On Thu, Nov 10, 2022, Robert Hoo wrote:
> > > After this patch set, still find some printk()s left in
> > > arch/x86/kvm/*,
> > > consider clean all of them up?
> > 
> > Hmm, yeah, I suppose at this point it makes sense to tack on a
> > patch to clean
> > them up.
> 
> Actually, I'm going to pass on this for now.  The series is already
> too big.  I'll
> add this to my todo list for the future.

That's all right, thanks for update.


