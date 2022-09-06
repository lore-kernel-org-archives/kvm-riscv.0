From: Heiko Stübner <heiko@sntech.de>
Date: Tue, 06 Sep 2022 16:34:49 +0200
Subject: [PATCH 1/3] RISC-V: Output cbom-block-size
In-Reply-To: <9f46a2dc-7515-c460-002a-29d8e32562df@microchip.com>
References: <20220906083555.931806-1-ajones@ventanamicro.com> <20220906092934.mn45eil73xh2lgel@kamzik> <9f46a2dc-7515-c460-002a-29d8e32562df@microchip.com>
Message-ID: <2994956.KTMopqUuYO@diego>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Am Dienstag, 6. September 2022, 11:42:11 CEST schrieb Conor.Dooley at microchip.com:
> On 06/09/2022 10:29, Andrew Jones wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> > 
> > On Tue, Sep 06, 2022 at 09:00:20AM +0000, Conor.Dooley at microchip.com wrote:
> >> On 06/09/2022 09:55, Andrew Jones wrote:
> >>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> >>>
> >>> On Tue, Sep 06, 2022 at 08:40:23AM +0000, Conor.Dooley at microchip.com wrote:
> >>>> On 06/09/2022 09:35, Andrew Jones wrote:
> >>>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> >>>>>
> >>>>> Provide an info message with the block size when the Zicbom extension is
> >>>>> present and the block size has been determined.
> >>>>
> >>>> Why might someone care about this?
> >>>
> >>> I was unaware of anywhere else besides hardware descriptions where this is
> >>> published. And, while dmesg isn't really publishing it in a way that is
> >>> useful to anything other than human readers either, it at least makes it
> >>> easy for a user to check it for sanity purposes (which is what I used it
> >>> for) or even for applying it if they want to write something that needs it
> >>> and the OS provides U-mode access to CMO.
> >>>
> >>> I'm not married to the idea, though, so if people would rather have less
> >>> logs than this information, then I'm fine with dropping the patch.
> >>
> >> I don't really care either way about logging it, if it helps people to
> >> be able to see it perhaps there's a better location than dmesg -
> >> would {debug,sys}fs be overkill?
> > 
> > Thinking about this some more, I think sysfs would probably be the better
> > way to go from the start. This patch should probably be dropped and I
> > can try to add a sysfs node. The hard part of that will be the naming...
> > How about
> > 
> >   /sys/devices/system/cpu/cpu*/cache/cmo_block_size
> 
> Seems sane to me, but I am oh-so-very-far from an expert here.
> Heiko might have a more qualified opinion.

I guess I'd more start with a pr_debug(). When debugging you
get the output and regular users won't care at all anyway.
Otherwise you can also just
	cat /proc/device-tree/cpus/cpu\@0/riscv\,cbom-block-size | xxd -p


Sysfs is whole different can of worms, as you create a new userspace
facing interface, which you need to support indefinitly.


Similar to Conor, I guess it would be interesting to me, what problem
you're trying to solve, as in my (simple) thinking, everybody that somehow
needs to check the block-size should have the knowledge to get it from
any of the dt representations we already have ;-) 


Heiko



> >> I was just more interested in the motivation behind the change itself.
> >> Maybe some of the above in the commit message wuld be nice?
> >>
> >>>
> >>> Thanks,
> >>> drew
> >>>
> >>>>
> >>>>>
> >>>>> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> >>>>> ---
> >>>>>     arch/riscv/mm/cacheflush.c | 4 +++-
> >>>>>     1 file changed, 3 insertions(+), 1 deletion(-)
> >>>>>
> >>>>> diff --git a/arch/riscv/mm/cacheflush.c b/arch/riscv/mm/cacheflush.c
> >>>>> index e5b087be1577..8595baf8e403 100644
> >>>>> --- a/arch/riscv/mm/cacheflush.c
> >>>>> +++ b/arch/riscv/mm/cacheflush.c
> >>>>> @@ -122,7 +122,9 @@ void riscv_init_cbom_blocksize(void)
> >>>>>                    }
> >>>>>            }
> >>>>>
> >>>>> -       if (probed_block_size)
> >>>>> +       if (probed_block_size) {
> >>>>>                    riscv_cbom_block_size = probed_block_size;
> >>>>> +               pr_info("riscv: Zicbom: Cache blocksize is %u bytes", probed_block_size);
> >>>>> +       }
> >>>>>     }
> >>>>>     #endif
> >>>>> --
> >>>>> 2.37.2
> >>>>>
> >>>>
> >>
> 
> 





