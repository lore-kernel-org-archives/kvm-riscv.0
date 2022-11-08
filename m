From: Huang, Kai <kai.huang@intel.com>
Date: Tue, 8 Nov 2022 01:09:27 +0000
Subject: [PATCH 00/44] KVM: Rework kvm_init() and hardware enabling
In-Reply-To: <20221107214634.GE1063309@ls.amr.corp.intel.com>
References: <20221102231911.3107438-1-seanjc@google.com>
	 <20221104071749.GC1063309@ls.amr.corp.intel.com>
	 <Y2V1oslbw24/2Opd@google.com>
	 <20221107214634.GE1063309@ls.amr.corp.intel.com>
Message-ID: <bf29fe1ac84cae8ddb06e566b56c653600a1901c.camel@intel.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, 2022-11-07 at 13:46 -0800, Isaku Yamahata wrote:
> > On Fri, Nov 04, 2022, Isaku Yamahata wrote:
> > > Thanks for the patch series. I the rebased TDX KVM patch series and it
> > > worked.
> > > Since cpu offline needs to be rejected in some cases(To keep at least one
> > > cpu
> > > on a package), arch hook for cpu offline is needed.
> > 
> > I hate to bring this up because I doubt there's a real use case for SUSPEND
> > with
> > TDX, but the CPU offline path isn't just for true offlining of CPUs.? When
> > the
> > system enters SUSPEND, only the initiating CPU goes through
> > kvm_suspend()+kvm_resume(),
> > all responding CPUs go through CPU offline+online.? I.e. disallowing all
> > CPUs from
> > going "offline" will prevent suspending the system.
> 
> The current TDX KVM implementation disallows CPU package from offline only
> when
> TDs are running.? If no TD is running, CPU offline is allowed.? So before
> SUSPEND, TDs need to be killed via systemd or something.? After killing TDs,
> the
> system can enter into SUSPEND state.

This seems not correct.  You need one cpu for each to be online in order to
create TD as well, as TDH.MNG.KEY.CONFIG needs to be called on all packages,
correct?
