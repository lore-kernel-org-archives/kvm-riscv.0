From: Nikolas Wipper <nikwip@amazon.de>
Date: Fri, 4 Oct 2024 12:44:30 +0200
Subject: [PATCH 00/15] KVM: x86: Introduce new ioctl KVM_TRANSLATE2
In-Reply-To: <20240910152207.38974-1-nikwip@amazon.de>
References: <20240910152207.38974-1-nikwip@amazon.de>
Message-ID: <3208be2b-7e9f-413b-a9dc-c36ef4e3d177@amazon.de>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

I saw this on another series[*]:

> if KVM_TRANSLATE2 lands (though I'm somewhat curious as to why QEMU doesn't do
> the page walks itself).

The simple reason for keeping this functionality in KVM, is that it already
has a mature, production-level page walker (which is already exposed) and
creating something similar QEMU would take a lot longer and would be much
harder to maintain than just creating an API that leverages the existing
walker.

[*] https://lore.kernel.org/lkml/ZvJseVoT7gN_GBG3 at google.com/T/#mb0b23a1f5023192a442db4a16629d9ca74eb6b5e

ps: this is also a gentle ping for review, if this got lost in between
conferences



Amazon Web Services Development Center Germany GmbH
Krausenstr. 38
10117 Berlin
Geschaeftsfuehrung: Christian Schlaeger, Jonathan Weiss
Eingetragen am Amtsgericht Charlottenburg unter HRB 257764 B
Sitz: Berlin
Ust-ID: DE 365 538 597
