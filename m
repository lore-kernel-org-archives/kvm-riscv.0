From: Huang, Kai <kai.huang@intel.com>
Date: Tue, 8 Nov 2022 10:35:02 +0000
Subject: [PATCH 00/44] KVM: Rework kvm_init() and hardware enabling
In-Reply-To: <9890f67846f1c2c6a12bd086fc822f0762966223.camel@intel.com>
References: <20221102231911.3107438-1-seanjc@google.com>
	 <20221104071749.GC1063309@ls.amr.corp.intel.com>
	 <Y2V1oslbw24/2Opd@google.com>
	 <20221107214634.GE1063309@ls.amr.corp.intel.com>
	 <bf29fe1ac84cae8ddb06e566b56c653600a1901c.camel@intel.com>
	 <20221108054354.GA1708572@ls.amr.corp.intel.com>
	 <9890f67846f1c2c6a12bd086fc822f0762966223.camel@intel.com>
Message-ID: <4ea4f8422b22486717239b39a0c206e7a91d49a8.camel@intel.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, 2022-11-08 at 08:56 +0000, Huang, Kai wrote:
> On Mon, 2022-11-07 at 21:43 -0800, Isaku Yamahata wrote:
> > On Tue, Nov 08, 2022 at 01:09:27AM +0000,
> > "Huang, Kai" <kai.huang@intel.com> wrote:
> > 
> > > On Mon, 2022-11-07 at 13:46 -0800, Isaku Yamahata wrote:
> > > > > On Fri, Nov 04, 2022, Isaku Yamahata wrote:
> > > > > > Thanks for the patch series. I the rebased TDX KVM patch series and it
> > > > > > worked.
> > > > > > Since cpu offline needs to be rejected in some cases(To keep at least one
> > > > > > cpu
> > > > > > on a package), arch hook for cpu offline is needed.
> > > > > 
> > > > > I hate to bring this up because I doubt there's a real use case for SUSPEND
> > > > > with
> > > > > TDX, but the CPU offline path isn't just for true offlining of CPUs.? When
> > > > > the
> > > > > system enters SUSPEND, only the initiating CPU goes through
> > > > > kvm_suspend()+kvm_resume(),
> > > > > all responding CPUs go through CPU offline+online.? I.e. disallowing all
> > > > > CPUs from
> > > > > going "offline" will prevent suspending the system.
> > > > 
> > > > The current TDX KVM implementation disallows CPU package from offline only
> > > > when
> > > > TDs are running.? If no TD is running, CPU offline is allowed.? So before
> > > > SUSPEND, TDs need to be killed via systemd or something.? After killing TDs,
> > > > the
> > > > system can enter into SUSPEND state.
> > > 
> > > This seems not correct.  You need one cpu for each to be online in order to
> > > create TD as well, as TDH.MNG.KEY.CONFIG needs to be called on all packages,
> > > correct?
> > 
> > That's correct. In such case, the creation of TD fails.  TD creation checks if
> > at least one cpu is online on all CPU packages.  If no, error.
> 
> I think we can just always refuse to offline the last cpu for each package when
> TDX is enabled.  It's simpler I guess.

Sorry I wasn't reading carefully.  Please ignore.  We need to support suspend :)
