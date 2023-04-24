From: Dave Hansen <dave.hansen@intel.com>
Date: Mon, 24 Apr 2023 06:48:09 -0700
Subject: [RFC 45/48] RISC-V: ioremap: Implement for arch specific ioremap
 hooks
In-Reply-To: <CAHBxVyFhDapAeMQ8quBqWZ10jWSHw1CdE227ciyKQpULHYzffA@mail.gmail.com>
References: <20230419221716.3603068-1-atishp@rivosinc.com>
 <20230419221716.3603068-46-atishp@rivosinc.com>
 <69ba1760-a079-fd8f-b079-fcb01e3eedec@intel.com>
 <CAHBxVyFhDapAeMQ8quBqWZ10jWSHw1CdE227ciyKQpULHYzffA@mail.gmail.com>
Message-ID: <81c476f4-ef62-e4a6-0033-8a46a15379fd@intel.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 4/21/23 12:24, Atish Kumar Patra wrote:
> On Fri, Apr 21, 2023 at 3:46?AM Dave Hansen <dave.hansen@intel.com> wrote:>> This callback appears to say to the host:
>>
>>         Hey, I (the guest) am treating this guest physical area as MMIO.
>>
>> But the host and guest have to agree _somewhere_ what the MMIO is used
>> for, not just that it is being used as MMIO.
> 
> Yes. The TSM (TEE Security Manager) which is equivalent to TDX also 
> needs to be aware of the MMIO regions so that it can forward the
> faults accordingly. Most of the MMIO is emulated in the host
> (userspace or kernel emulation if present). The host is outside the
> trust boundary of the guest. Thus, guest needs to make sure the host 
> only emulates the designated MMIO region. Otherwise, it opens an 
> attack surface from a malicious host.
How does this mechanism stop the host from emulating something outside
the designated region?

On TDX, for instance, the guest page table have a shared/private bit.
Private pages get TDX protections to (among other things) keep the page
contents confidential from the host.  Shared pages can be used for MMIO
and don't have those protections.

If the host goes and tries to flip a page from private->shared, TDX
protections will kick in and prevent it.

None of this requires the guest to tell the host where it expects MMIO
to be located.

> All other confidential computing solutions also depend on guest 
> initiated MMIO as well. AFAIK, the TDX & SEV relies on #VE like
> exceptions to invoke that while this patch is similar to what pkvm
> does. This approach lets the enlightened guest control which MMIO
> regions it wants the host to emulate.

I'm not _quite_ sure what "guest initiated" means.  But SEV and TDX
don't require an ioremap hook like this.  So, even if they *are* "guest
initiated", the question still remains how they work without this patch,
or what they are missing without it.

> It can be a subset of the region's host provided the layout. The
> guest device filtering solution is based on this idea as well [1].
> 
> [1] https://lore.kernel.org/all/20210930010511.3387967-1-sathyanarayanan.kuppuswamy at linux.intel.com/

I don't really see the connection.  Even if that series was going
forward (I'm not sure it is) there is no ioremap hook there.  There's
also no guest->host communication in that series.  The guest doesn't
_tell_ the host where the MMIO is, it just declines to run code for
devices that it didn't expect to see.

I'm still rather confused here.

