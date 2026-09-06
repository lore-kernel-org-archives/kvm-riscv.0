Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B02EC79F8C
	for <kvm-riscv@archiver.kernel.org>; Sun,  6 Sep 2026 17:28:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VULV91HSqFeAkVQz7SZvtg6dTZWfAtG0OBO5Ra+h/mg=; b=MgssHqEbS6HszW
	Xi9lC56pwFU6HOVv0h0G4nqMy7xaahLZn11DCdWJee61DZC5j6hNqRxZd8FlaGXSx0RkgBy/QuPgw
	FCHXOgyvBlWxcB2Jajf4ExnAeRhsCZkaURxK5BvUFIcrPlJV0c/ek2GYQUNiQ9DR7flDI9IYpjL4s
	v/R7BPQnm19AN+1DgCdXGHbdXUzhg8CX2BsXcqoZsVE+eGFGPSPk6yxOg5lKTfBDQY90UJCyvUkqC
	rmj1Xd4pEbQ8N3M48IiXR0q0jBKpeLZRD1zKSnSpBwZQsDK/zlMYAGIeT7zdufN0CIoNsGU1njzSD
	nvVlvW6UNAwMfRLcRWAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3GfM-00000005EGL-36OY;
	Sun, 06 Sep 2026 17:28:28 +0000
Received: from out-148.mta0.migadu.com ([2001:41d0:1004:224b::94] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3GfK-00000005EFz-1P5g
	for kvm-riscv@lists.infradead.org;
	Sun, 06 Sep 2026 17:28:27 +0000
X-Envelope-To: kvm-riscv@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=YwGoDagFONg4c7PymmNjipFffu7Q05S+kvFKbHIFZp0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788715704; v=1; x=1789320504;
 b=SitwtVyJAZ7y8Onl26coloKvh8wZGJJyn2xDsXIZ5Q7JQPNlc3/y5+ZZ9aIM/RdzVwVdg9ue
 CfRnhVNeJwxVW4LyXhiPynCXXc/xkHkMwNYxbosvktTCqfLA6wDt5cV7OAp2h1oeirWgOe166fz
 85ofdhK8NS6QhLHgMkWQX7Sc=
X-Envelope-To: kvm-riscv@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id c69c1d23d5f6c273;
	Sun, 06 Sep 2026 17:28:24 +0000
X-Mizu-Trace-ID: c69c1d23d5f6c273
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b4a0b17358so3185e87.1
        for <kvm-riscv@lists.infradead.org>; Sun, 06 Sep 2026 10:28:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwqoD/HGTtk33FuF+UEUeQT7gxHcQYooEqRAcyL7tX62YbKA8Sa9A3SurZpU8jVqBwaZT+DRnQLwr8=@lists.infradead.org
X-Gm-Message-State: AFuF++mbnKSDSp54TQzrpdA7DPVCHUig1NqJZL4cM8PEBbJGidMDZuAf
	YV1gbqEgck9Zs0PtsOvIt/bYUfcCoBBKwvCvA7hSX5Z4/DQjUWWlqt7aKX+u/N0qnrzyM2QHs6j
	+wAdi177HKazjlkWbFxEehvYyO9c7tBcPleVxFOan
X-Received: by 2002:a05:6512:2347:b0:5b4:9dba:4ecf with SMTP id
 2adb3069b0e04-5b74d405b3dmr98775e87.13.1788715699098; Sun, 06 Sep 2026
 10:28:19 -0700 (PDT)
MIME-Version: 1.0
References: <20260904175550.430266-1-dongli.zhang@oracle.com> <20260904175550.430266-4-dongli.zhang@oracle.com>
In-Reply-To: <20260904175550.430266-4-dongli.zhang@oracle.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Sun, 6 Sep 2026 18:27:42 +0100
X-Gmail-Original-Message-ID: <CA+EHjTzB3HA5CS=avLMEfV3CgYRmgWiLp7SKBBvAW0ScmxhpZg@mail.gmail.com>
X-Gm-Features: AcwNN1VH8hihUI-lSdP6BhGDWguUGsQwGVRm6ivkEfPAVDdIwqp3LITyqIIBbeg
Message-ID: <CA+EHjTzB3HA5CS=avLMEfV3CgYRmgWiLp7SKBBvAW0ScmxhpZg@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] KVM: selftests: Test steal time across vCPU pid
 changes on x86
To: Dongli Zhang <dongli.zhang@oracle.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, loongarch@lists.linux.dev, 
	kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, 
	maz@kernel.org, oupton@kernel.org, joey.gouly@arm.com, seiden@linux.ibm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, zhaotianrui@loongson.cn, 
	maobibo@loongson.cn, chenhuacai@kernel.org, anup@brainfault.org, 
	atish.patra@linux.dev, seanjc@google.com, pbonzini@redhat.com, 
	shuah@kernel.org, dwmw2@infradead.org, joe.jin@oracle.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260906_102826_604005_4265A667 
X-CRM114-Status: GOOD (  28.15  )
X-BeenThere: kvm-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <kvm-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/kvm-riscv/>
List-Post: <mailto:kvm-riscv@lists.infradead.org>
List-Help: <mailto:kvm-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

Hi Dongli,

On Fri, 4 Sept 2026 at 18:56, Dongli Zhang <dongli.zhang@oracle.com> wrote:
>
> Add a selftest for the case where the same vCPU fd is run from a new host
> thread after steal time has already been enabled and updated.

Since this is based on steal_time.c anyway, would it make sense to
fold it in rather than add a separate file?

steal_time.c already has the per-arch scaffolding, so the pid-change
case could reuse the existing riscv and loongarch support (which you
said you couldn't add here for lack of hosts) instead of duplicating
the x86/arm64 setup. Or am I missing something?

Cheers,
/fuad



>
> Pin the vCPU thread and a busy-loop thread to CPU 0, force host-side
> run_delay to accumulate, and run the vCPU again to observe guest steal
> time. Then run the same vCPU fd from a newly created host thread and verify
> that the next steal time value observed on the new thread remains monotonic
> and sane relative to the value observed on the old thread.
>
> This indirectly validates that vcpu->last_steal is reset when the vCPU run
> PID changes.
>
> Assisted-by: Codex:GPT-5.5
> Signed-off-by: Dongli Zhang <dongli.zhang@oracle.com>
> ---
> As I have access to only x86 and arm64 KVM hosts, I created and validated
> the selftest on those two architectures only.
>
>  tools/testing/selftests/kvm/Makefile.kvm      |   1 +
>  .../selftests/kvm/steal_time_change_pid.c     | 162 ++++++++++++++++++
>  2 files changed, 163 insertions(+)
>  create mode 100644 tools/testing/selftests/kvm/steal_time_change_pid.c
>
> diff --git a/tools/testing/selftests/kvm/Makefile.kvm b/tools/testing/selftests/kvm/Makefile.kvm
> index 96bab7002d39..036c28849f84 100644
> --- a/tools/testing/selftests/kvm/Makefile.kvm
> +++ b/tools/testing/selftests/kvm/Makefile.kvm
> @@ -164,6 +164,7 @@ TEST_GEN_PROGS_x86 += irq_test
>  TEST_GEN_PROGS_x86 += mmu_stress_test
>  TEST_GEN_PROGS_x86 += rseq_test
>  TEST_GEN_PROGS_x86 += steal_time
> +TEST_GEN_PROGS_x86 += steal_time_change_pid
>  TEST_GEN_PROGS_x86 += system_counter_offset_test
>  TEST_GEN_PROGS_x86 += pre_fault_memory_test
>
> diff --git a/tools/testing/selftests/kvm/steal_time_change_pid.c b/tools/testing/selftests/kvm/steal_time_change_pid.c
> new file mode 100644
> index 000000000000..3c39594db398
> --- /dev/null
> +++ b/tools/testing/selftests/kvm/steal_time_change_pid.c
> @@ -0,0 +1,162 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Verify that KVM resets steal-time accounting when a vCPU fd is run from
> + * a different host PID.
> + */
> +
> +#include <pthread.h>
> +#include <asm/kvm_para.h>
> +#include "kvm_util.h"
> +#include "processor.h"
> +
> +#define ST_GPA_BASE            (1 << 30)
> +#define ST_SANE_DELTA_NS       (1ULL << 63)
> +
> +static void *st_gva;
> +static u64 guest_stolen_time;
> +static u64 main_steal;
> +static u64 thread_steal;
> +
> +#if defined(__x86_64__)
> +
> +#define STEAL_TIME_SIZE        ((sizeof(struct kvm_steal_time) + 63) & ~63)
> +
> +static void guest_code(void)
> +{
> +       struct kvm_steal_time *st = st_gva;
> +
> +       WRITE_ONCE(guest_stolen_time, READ_ONCE(st->steal));
> +       GUEST_SYNC(0);
> +
> +       WRITE_ONCE(guest_stolen_time, READ_ONCE(st->steal));
> +       GUEST_SYNC(1);
> +
> +       WRITE_ONCE(guest_stolen_time, READ_ONCE(st->steal));
> +       GUEST_DONE();
> +}
> +
> +static bool steal_time_supported(struct kvm_vcpu *vcpu)
> +{
> +       return kvm_cpu_has(X86_FEATURE_KVM_STEAL_TIME);
> +}
> +
> +static void steal_time_enable(struct kvm_vcpu *vcpu)
> +{
> +       vcpu_set_msr(vcpu, MSR_KVM_STEAL_TIME,
> +                    (ulong)st_gva | KVM_MSR_ENABLED);
> +}
> +
> +#else
> +#error "steal_time_change_pid is not implemented on this architecture"
> +#endif
> +
> +static void run_vcpu(struct kvm_vcpu *vcpu)
> +{
> +       struct ucall uc;
> +
> +       vcpu_run(vcpu);
> +
> +       switch (get_ucall(vcpu, &uc)) {
> +       case UCALL_SYNC:
> +       case UCALL_DONE:
> +               break;
> +       case UCALL_ABORT:
> +               REPORT_GUEST_ASSERT(uc);
> +       default:
> +               TEST_ASSERT(false, "Unexpected exit: %s",
> +                           exit_reason_str(vcpu->run->exit_reason));
> +       }
> +}
> +
> +static void *do_steal_time(void *arg)
> +{
> +       struct timespec ts, stop;
> +
> +       clock_gettime(CLOCK_MONOTONIC, &ts);
> +       stop = timespec_add_ns(ts, MIN_RUN_DELAY_NS);
> +
> +       while (timespec_to_ns(timespec_sub(ts, stop)) < 0)
> +               clock_gettime(CLOCK_MONOTONIC, &ts);
> +
> +       return NULL;
> +}
> +
> +static void *vcpu_thread(void *arg)
> +{
> +       struct kvm_vcpu *vcpu = arg;
> +
> +       run_vcpu(vcpu);
> +       sync_global_from_guest(vcpu->vm, guest_stolen_time);
> +       thread_steal = guest_stolen_time;
> +
> +       return NULL;
> +}
> +
> +int main(void)
> +{
> +       struct kvm_vcpu *vcpu;
> +       struct kvm_vm *vm;
> +       pthread_attr_t attr;
> +       pthread_t thread;
> +       cpu_set_t cpuset;
> +       long run_delay;
> +       long run_delay_delta;
> +
> +       ksft_print_header();
> +       ksft_set_plan(1);
> +
> +       CPU_ZERO(&cpuset);
> +       CPU_SET(0, &cpuset);
> +       pthread_attr_init(&attr);
> +       pthread_attr_setaffinity_np(&attr, sizeof(cpuset), &cpuset);
> +       pthread_setaffinity_np(pthread_self(), sizeof(cpuset), &cpuset);
> +
> +       vm = vm_create_with_one_vcpu(&vcpu, guest_code);
> +       vm_userspace_mem_region_add(vm, VM_MEM_SRC_ANONYMOUS,
> +                                   ST_GPA_BASE, 1, 1, 0);
> +       virt_map(vm, ST_GPA_BASE, ST_GPA_BASE, 1);
> +
> +       st_gva = (void *)ST_GPA_BASE;
> +       sync_global_to_guest(vm, st_gva);
> +       memset(addr_gva2hva(vm, ST_GPA_BASE), 0, STEAL_TIME_SIZE);
> +
> +       TEST_REQUIRE(steal_time_supported(vcpu));
> +
> +       steal_time_enable(vcpu);
> +       run_vcpu(vcpu);
> +
> +       run_delay = get_run_delay();
> +       pthread_create(&thread, &attr, do_steal_time, NULL);
> +
> +       while (get_run_delay() - run_delay < MIN_RUN_DELAY_NS)
> +               sched_yield();
> +
> +       pthread_join(thread, NULL);
> +       run_delay_delta = get_run_delay() - run_delay;
> +       TEST_ASSERT(run_delay_delta >= MIN_RUN_DELAY_NS,
> +                   "Expected run_delay >= %ld, got %ld",
> +                   MIN_RUN_DELAY_NS, run_delay_delta);
> +
> +       run_vcpu(vcpu);
> +       sync_global_from_guest(vm, guest_stolen_time);
> +       main_steal = guest_stolen_time;
> +
> +       TEST_ASSERT(main_steal >= MIN_RUN_DELAY_NS,
> +                   "Expected steal time >= %ld, got %"PRIu64,
> +                   MIN_RUN_DELAY_NS, main_steal);
> +
> +       pthread_create(&thread, NULL, vcpu_thread, vcpu);
> +       pthread_join(thread, NULL);
> +
> +       TEST_ASSERT(thread_steal >= main_steal &&
> +                   thread_steal - main_steal < ST_SANE_DELTA_NS,
> +                   "Expected sane steal after vCPU pid change: "
> +                   "old=%"PRIu64", new=%"PRIu64,
> +                   main_steal, thread_steal);
> +
> +       ksft_test_result_pass("steal time remains sane across vCPU pid change\n");
> +
> +       pthread_attr_destroy(&attr);
> +       kvm_vm_free(vm);
> +       ksft_finished();
> +}
> --
> 2.43.7
>

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
