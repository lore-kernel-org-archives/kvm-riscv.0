From: Andrea Parri <parri.andrea@gmail.com>
Date: Fri, 21 Jun 2024 13:24:18 +0200
Subject: [RFC v2 0/2] riscv: Idle thread using Zawrs extension
In-Reply-To: <ZnVhIi0Jre77i3RN@andrea>
References: <20240621093223.37893-1-luxu.kernel@bytedance.com>
 <ZnVhIi0Jre77i3RN@andrea>
Message-ID: <ZnVi4sGz/xDDigl/@andrea>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Jun 21, 2024 at 01:16:50PM +0200, Andrea Parri wrote:
> > This is the second version of idle thread based on Zawrs extension. We
> > rebased our code on Andrew's patch series[1] which provides basic
> > support for Zawrs as well as optimization for spinlock.
> 
> There's some feedback on Andrew's v2 [1] which seems to equally apply
> to the later, mentioned series/submission, and hence to the series in
> question (although only indirectly admittedly).
> 
> As an additional comment, please do add  linux-kernel at vger.kernel.org 
> (the LKML) to your Cc:  list on patch submission (again, this applies
> to both Andrew's and the present submissions).

Ah, yes, and possibly people mentioned in the changelog!  :-)  + Andrew

  Andrea

