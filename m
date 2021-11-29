From: Anup Patel <anup@brainfault.org>
Date: Mon, 29 Nov 2021 09:13:49 +0530
Subject: [PATCH 3/4] KVM: selftests: Add EXTRA_CFLAGS in top-level Makefile
In-Reply-To: <9545cab7-6365-b20d-fc05-82ace6368661@redhat.com>
References: <20211126154020.342924-1-anup.patel@wdc.com>
 <20211126154020.342924-4-anup.patel@wdc.com>
 <9545cab7-6365-b20d-fc05-82ace6368661@redhat.com>
Message-ID: <CAAhSdy0v=CrxJwiMtkPaR9y2WHcwqZZC9-mgc0ZncJ--69rVag@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Nov 26, 2021 at 9:45 PM Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> On 11/26/21 16:40, Anup Patel wrote:
> > We add EXTRA_CFLAGS to the common CFLAGS of top-level Makefile
> > which will allow users to pass additional compile-time flags such
> > as "-static".
>
> Is this just for debugging?  I cannot understand if it's used in patch 4.

Yes, this is just for debugging.

I am using it to add selftests ELFs to any arbitrary initrd so that I can
try selftests on Spike, FPGA, or even HW simulators.

Regards,
Anup

>
> Paolo
>

