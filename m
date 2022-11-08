From: Sean Christopherson <seanjc@google.com>
Date: Tue, 8 Nov 2022 17:46:32 +0000
Subject: [PATCH 00/44] KVM: Rework kvm_init() and hardware enabling
In-Reply-To: <20221107214634.GE1063309@ls.amr.corp.intel.com>
References: <20221102231911.3107438-1-seanjc@google.com>
 <20221104071749.GC1063309@ls.amr.corp.intel.com>
 <Y2V1oslbw24/2Opd@google.com>
 <20221107214634.GE1063309@ls.amr.corp.intel.com>
Message-ID: <Y2qV+IGKyKQItMj2@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Nov 07, 2022, Isaku Yamahata wrote:
> On Fri, Nov 04, 2022 at 08:27:14PM +0000,
> Sean Christopherson <seanjc@google.com> wrote:
> 
> > On Fri, Nov 04, 2022, Isaku Yamahata wrote:
> > > Thanks for the patch series. I the rebased TDX KVM patch series and it worked.
> > > Since cpu offline needs to be rejected in some cases(To keep at least one cpu
> > > on a package), arch hook for cpu offline is needed.
> > 
> > I hate to bring this up because I doubt there's a real use case for SUSPEND with
> > TDX, but the CPU offline path isn't just for true offlining of CPUs.  When the
> > system enters SUSPEND, only the initiating CPU goes through kvm_suspend()+kvm_resume(),
> > all responding CPUs go through CPU offline+online.  I.e. disallowing all CPUs from
> > going "offline" will prevent suspending the system.
> 
> The current TDX KVM implementation disallows CPU package from offline only when
> TDs are running.  If no TD is running, CPU offline is allowed.  So before
> SUSPEND, TDs need to be killed via systemd or something.  After killing TDs, the
> system can enter into SUSPEND state.

Ah, I assumed offlining was disallowed if TDX was enabled.

> > I don't see anything in the TDX series or the specs that suggests suspend+resume
> > is disallowed when TDX is enabled, so blocking that seems just as wrong as
> > preventing software from soft-offlining CPUs.
> 
> When it comes to SUSPEND, it means suspend-to-idle, ACPI S1, S3, or S4.
> suspend-to-idle doesn't require CPU offline.
> 
> Although CPU related spec doesn't mention about S3, the ACPI spec says
> 
>   7.4.2.2 System _S1 State (Sleeping with Processor Context Maintained)
>   The processor-complex context is maintained.
> 
>   7.4.2.4 System _S3 State or 7.4.2.5 System _S4 State
>   The processor-complex context is not maintained.
> 
> It's safe to say the processor context related to TDX is complex, I think.
> Let me summarize the situation. What do you think?
> 
> - While no TD running:
>   No additional limitation on CPU offline.
> 
> - On TD creation:
>   If any of whole cpu package is software offlined, TD creation fails.
>   Alternative: forcibly online necessary CPUs, create TD, and offline CPUs

The alternative isn't really viable because there's no way the kernel can guarantee
a CPU can be onlined, i.e. the kernel would need to fallback of disallowing TD
creation anyways.

> - TD running:
>   Although it's not required to keep all CPU packages online, keep CPU package
>   from offlining for TD destruction.
> 
> - TD destruction:
>   If any of whole cpu package is software offlined, TD destruction fails.
>   The current implementation prevents any cpu package from offlinining during
>   TD running.
>   Alternative:
>   - forcibly online necessary CPUs, destruct TD, and offline CPUs again and
>     allow CPU package to offline
>   - Stash TDX resources somewhere. When cpu packages are onlined, free those
>     release.
> 
> - On SUSPEND:
>   TODO: Allow CPU offline if S1 is requested.

Is this actually a TODO?  I assume the kernel doesn't actually try to offline
CPUs in this case, i.e. it Just Works.

>   - suspend-to-idle: nothing to do because cpu offline isn't required
>   - ACPI S1: Need to allow offline CPUs.  This can be implemented by referencing
>     suspend_state_t pm_suspend_target_state is PM_SUSPEND_TO_STANBY.
>   - ACPI S3/S4: refuse cpu offline.  The system needs to kill all TDs before
>     starting SUSPEND process. This is what is implemented.

Looks good, disallowing SUSPEND with active TDs is a reasonable tradeoff.  As
above, I highly doubt anyone actually cares.

