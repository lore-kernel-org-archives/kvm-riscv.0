From: Sean Christopherson <seanjc@google.com>
Date: Wed, 16 Nov 2022 15:52:26 +0000
Subject: [PATCH 13/44] KVM: x86: Serialize vendor module initialization
 (hardware setup)
In-Reply-To: <e8e3b4c7bf3bd733c626618b57f9bf2f1835770e.camel@intel.com>
References: <20221102231911.3107438-1-seanjc@google.com>
 <20221102231911.3107438-14-seanjc@google.com>
 <e8e3b4c7bf3bd733c626618b57f9bf2f1835770e.camel@intel.com>
Message-ID: <Y3UHOg7E0iRFpjml@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Nov 16, 2022, Huang, Kai wrote:
> On Wed, 2022-11-02 at 23:18 +0000, Sean Christopherson wrote:
> > Acquire a new mutex, vendor_module_lock, in kvm_x86_vendor_init() while
> > doing hardware setup to ensure that concurrent calls are fully serialized.
> > KVM rejects attempts to load vendor modules if a different module has
> > already been loaded, but doesn't handle the case where multiple vendor
> > modules are loaded at the same time, and module_init() doesn't run under
> > the global module_mutex.
> > 
> > Note, in practice, this is likely a benign bug as no platform exists that
> > supports both SVM and VMX, i.e. barring a weird VM setup, one of the
> > vendor modules is guaranteed to fail a support check before modifying
> > common KVM state.
> > 
> > Alternatively, KVM could perform an atomic CMPXCHG on .hardware_enable,
> > but that comes with its own ugliness as it would require setting
> > .hardware_enable before success is guaranteed, e.g. attempting to load
> > the "wrong" could result in spurious failure to load the "right" module.
> > 
> > Introduce a new mutex as using kvm_lock is extremely deadlock prone due
> > to kvm_lock being taken under cpus_write_lock(), and in the future, under
> > under cpus_read_lock().  Any operation that takes cpus_read_lock() while
> > holding kvm_lock would potentially deadlock, e.g. kvm_timer_init() takes
> > cpus_read_lock() to register a callback.  In theory, KVM could avoid
> > such problematic paths, i.e. do less setup under kvm_lock, but avoiding
> > all calls to cpus_read_lock() is subtly difficult and thus fragile.  E.g.
> > updating static calls also acquires cpus_read_lock().
> > 
> > Inverting the lock ordering, i.e. always taking kvm_lock outside
> > cpus_read_lock(), is not a viable option, e.g. kvm_online_cpu() takes
> > kvm_lock and is called under cpus_write_lock().
> 
> "kvm_online_cpu() takes kvm_lock and is called under cpus_write_lock()" hasn't
> happened yet.

Doh, right.  Thanks!

> > The lockdep splat below is dependent on future patches to take
> > cpus_read_lock() in hardware_enable_all(), but as above, deadlock is
> > already is already possible.
> 
> IIUC kvm_lock by design is supposed to protect vm_list, thus IMHO naturally it
> doesn't fit to protect multiple vendor module loading.

A different way to look at it is that kvm_lock protects anything that is global to
all of KVM, and it just so happens that lists and counters of VMs are the only
such resources (lumping in the usage in vm_uevent_notify_change() and the future
usage to protect kvm_usage_count).

> Looks above argument is good enough.  I am not sure  whether we need additional
> justification which comes from future patches. :)

To try to prevent someone from trying to eliminate the "extra" lock, like this
series does for kvm_count_lock.  Hopefully future someones that want to clean up
the code do a git blame to understand why the lock was introduced and don't waste
their time running into the same issues (or worse, don't run into the issues and
break KVM).

> Also, do you also want to update Documentation/virt/kvm/locking.rst" in this
> patch?

Hmm, yeah.  That'd also be a good place to document why kvm_lock isn't used.

