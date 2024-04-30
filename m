From: Clément Léger <cleger@rivosinc.com>
Date: Tue, 30 Apr 2024 17:35:36 +0200
Subject: [RFC PATCH 7/7] RISC-V: KVM: add support for double trap
 exception
In-Reply-To: <ZixV3lCe3jYQN3Qx@debug.ba.rivosinc.com>
References: <20240418142701.1493091-1-cleger@rivosinc.com>
 <20240418142701.1493091-8-cleger@rivosinc.com>
 <ZixV3lCe3jYQN3Qx@debug.ba.rivosinc.com>
Message-ID: <b4228cda-b072-479d-bce0-3af42ce49811@rivosinc.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On 27/04/2024 03:33, Deepak Gupta wrote:
>> /**
>> ?* kvm_riscv_vcpu_trap_redirect -- Redirect trap to Guest
>> ?*
>> ?* @vcpu: The VCPU pointer
>> ?* @trap: Trap details
>> ?*/
>> -void kvm_riscv_vcpu_trap_redirect(struct kvm_vcpu *vcpu,
>> -????????????????? struct kvm_cpu_trap *trap)
>> +int kvm_riscv_vcpu_trap_redirect(struct kvm_vcpu *vcpu,
>> +???????????????? struct kvm_cpu_trap *trap)
>> {
>> ????unsigned long vsstatus = csr_read(CSR_VSSTATUS);
>>
>> +??? if (riscv_isa_extension_available(vcpu->arch.isa, SSDBLTRP)) {
>> +??????? if (vsstatus & SR_SDT)
>> +??????????? return kvm_riscv_double_trap(vcpu, trap);
>> +
>> +??????? /* Set Double Trap bit to enable double trap detection */
>> +??????? vsstatus |= SR_SDT;
> 
> I didn't get it.
> Why do this without checking if current config allows us to do so ?
> I am imagining we do this only when henvcfg for current vcpu says that
> DTE=1
> for this this guest, right?

We actually do not really care since if not enabled, this bit will be
masked by the hardware when writing it to the CSR. I could indeed add a
check for that but in the end, it will yield the same result. In that
case, just ORing it with the value seems more efficient than adding an
"if" to check if the extension and DTE is enabled.

Cl?ment


