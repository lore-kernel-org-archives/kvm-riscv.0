From: Xu Lu <luxu.kernel@bytedance.com>
Date: Fri, 21 Jun 2024 20:09:10 +0800
Subject: [External] Re: [RFC v2 0/2] riscv: Idle thread using Zawrs extension
In-Reply-To: <ZnVhIi0Jre77i3RN@andrea>
References: <20240621093223.37893-1-luxu.kernel@bytedance.com> <ZnVhIi0Jre77i3RN@andrea>
Message-ID: <CAPYmKFuS-wJTfZBeVo_AS9PscLC7zSiEDZnRU9NDB5+LYxjNSw@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Jun 21, 2024 at 7:17?PM Andrea Parri <parri.andrea@gmail.com> wrote:
>
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
>
>   Andrea
>
> [1] https://lore.kernel.org/linux-riscv/ZiWCP6f6zZ3dKXfN at andrea/
Hi Andrea,

Thanks a lot for your reminder. I will check the feedback and add this
email in the next patch series!

Xu Lu

