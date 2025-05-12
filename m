Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0FEAC3ABC3
	for <kvm-riscv@archiver.kernel.org>; Mon, 12 May 2025 18:17:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OBsydZyPfH+PRSN1ZsplHkm93j0jTGtog+VHpGUMBvI=; b=ll+rmWpI/ISEMV
	PM/q27VYq59Q34w2DcWtxaVvxTxIfNtoO5b9feAmGzJH6uuJIlfWezOAw0UhiC3q4uWwHUVED52hH
	xdsgBsoi142II2qLfDT9sK4CnmAEVfTXAuP0t9VXt1SYCTvU5XUxIp33yh0u1vRvwzWynoYkSD1Sj
	Hj4NMPYuYNW4i1P8TolQ/W2tU0WCocKP8hbRF+X9f+R8o/maHmMLlKP8u01v3UwY0rlnZdFowCSYd
	5zVrIcju931YHfxrcE5wt2VAXNC0fALuVs0CuUhDD0O6xFVPI3Adrg9ztrti5rka0u87rJpuXw9Nq
	lRW2IsPVbiXxXhchiGfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEXi1-0000000AKrs-1jnF;
	Mon, 12 May 2025 18:17:01 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEXW2-0000000AHGt-3qPZ
	for kvm-riscv@lists.infradead.org;
	Mon, 12 May 2025 18:04:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747073077;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Z2T7ycCKwqZIMsv2I6XJvuhGXIY81vCrox7I0j0GM+0=;
	b=JljArnggOISaESXmRR0uhaVUqXXSOVLr4uwh4ytK0nrwQeBI6pswhP4pluV267vyJTADPh
	45gMP5JatlozxyZEaRDLERkSMiq5BAywa/WpXtoknvsKuFn98rr0gJQtby1ZmhWuVJqw6D
	7XR4+I7i+NH+kNsoGO5/rM8PTlHGNRo=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-418-bCO2M7_lMsCo5R7BHCagxQ-1; Mon,
 12 May 2025 14:04:36 -0400
X-MC-Unique: bCO2M7_lMsCo5R7BHCagxQ-1
X-Mimecast-MFC-AGG-ID: bCO2M7_lMsCo5R7BHCagxQ_1747073066
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 987FE1955D4A;
	Mon, 12 May 2025 18:04:25 +0000 (UTC)
Received: from intellaptop.lan (unknown [10.22.80.5])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id B654930001A1;
	Mon, 12 May 2025 18:04:17 +0000 (UTC)
From: Maxim Levitsky <mlevitsk@redhat.com>
To: kvm@vger.kernel.org
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Jing Zhang <jingzhangos@google.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Sebastian Ott <sebott@redhat.com>,
	Shusen Li <lishusen2@huawei.com>,
	Waiman Long <longman@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-arm-kernel@lists.infradead.org,
	Bjorn Helgaas <bhelgaas@google.com>,
	Borislav Petkov <bp@alien8.de>,
	Anup Patel <anup@brainfault.org>,
	Will Deacon <will@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexander Potapenko <glider@google.com>,
	kvmarm@lists.linux.dev,
	Keisuke Nishimura <keisuke.nishimura@inria.fr>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Atish Patra <atishp@atishpatra.org>,
	Joey Gouly <joey.gouly@arm.com>,
	x86@kernel.org,
	Marc Zyngier <maz@kernel.org>,
	Sean Christopherson <seanjc@google.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Kunkun Jiang <jiangkunkun@huawei.com>,
	linux-riscv@lists.infradead.org,
	Randy Dunlap <rdunlap@infradead.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-kernel@vger.kernel.org,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	kvm-riscv@lists.infradead.org,
	Maxim Levitsky <mlevitsk@redhat.com>,
	Ingo Molnar <mingo@redhat.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Subject: [PATCH v5 1/6] locking/mutex: implement mutex_trylock_nested
Date: Mon, 12 May 2025 14:04:02 -0400
Message-ID: <20250512180407.659015-2-mlevitsk@redhat.com>
In-Reply-To: <20250512180407.659015-1-mlevitsk@redhat.com>
References: <20250512180407.659015-1-mlevitsk@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_110439_137265_CB3D458C 
X-CRM114-Status: GOOD (  20.01  )
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

Despite the fact that several lockdep-related checks are skipped when
calling trylock* versions of the locking primitives, for example
mutex_trylock, each time the mutex is acquired, a held_lock is still
placed onto the lockdep stack by __lock_acquire() which is called
regardless of whether the trylock* or regular locking API was used.

This means that if the caller successfully acquires more than
MAX_LOCK_DEPTH locks of the same class, even when using mutex_trylock,
lockdep will still complain that the maximum depth of the held lock stack
has been reached and disable itself.

For example, the following error currently occurs in the ARM version
of KVM, once the code tries to lock all vCPUs of a VM configured with more
than MAX_LOCK_DEPTH vCPUs, a situation that can easily happen on modern
systems, where having more than 48 CPUs is common, and it's also common to
run VMs that have vCPU counts approaching that number:

[  328.171264] BUG: MAX_LOCK_DEPTH too low!
[  328.175227] turning off the locking correctness validator.
[  328.180726] Please attach the output of /proc/lock_stat to the bug report
[  328.187531] depth: 48  max: 48!
[  328.190678] 48 locks held by qemu-kvm/11664:
[  328.194957]  #0: ffff800086de5ba0 (&kvm->lock){+.+.}-{3:3}, at: kvm_ioctl_create_device+0x174/0x5b0
[  328.204048]  #1: ffff0800e78800b8 (&vcpu->mutex){+.+.}-{3:3}, at: lock_all_vcpus+0x16c/0x2a0
[  328.212521]  #2: ffff07ffeee51e98 (&vcpu->mutex){+.+.}-{3:3}, at: lock_all_vcpus+0x16c/0x2a0
[  328.220991]  #3: ffff0800dc7d80b8 (&vcpu->mutex){+.+.}-{3:3}, at: lock_all_vcpus+0x16c/0x2a0
[  328.229463]  #4: ffff07ffe0c980b8 (&vcpu->mutex){+.+.}-{3:3}, at: lock_all_vcpus+0x16c/0x2a0
[  328.237934]  #5: ffff0800a3883c78 (&vcpu->mutex){+.+.}-{3:3}, at: lock_all_vcpus+0x16c/0x2a0
[  328.246405]  #6: ffff07fffbe480b8 (&vcpu->mutex){+.+.}-{3:3}, at: lock_all_vcpus+0x16c/0x2a0

Luckily, in all instances that require locking all vCPUs, the
'kvm->lock' is taken a priori, and that fact makes it possible to use
the little known feature of lockdep, called a 'nest_lock', to avoid this
warning and subsequent lockdep self-disablement.

The action of 'nested lock' being provided to lockdep's lock_acquire(),
causes the lockdep to detect that the top of the held lock stack contains
a lock of the same class and then increment its reference counter instead
of pushing a new held_lock item onto that stack.

See __lock_acquire for more information.

Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
---
 include/linux/mutex.h  | 15 +++++++++++++++
 kernel/locking/mutex.c | 14 +++++++++++---
 2 files changed, 26 insertions(+), 3 deletions(-)

diff --git a/include/linux/mutex.h b/include/linux/mutex.h
index 2143d05116be..da4518cfd59c 100644
--- a/include/linux/mutex.h
+++ b/include/linux/mutex.h
@@ -193,7 +193,22 @@ extern void mutex_lock_io(struct mutex *lock);
  *
  * Returns 1 if the mutex has been acquired successfully, and 0 on contention.
  */
+
+#ifdef CONFIG_DEBUG_LOCK_ALLOC
+extern int _mutex_trylock_nest_lock(struct mutex *lock, struct lockdep_map *nest_lock);
+
+#define mutex_trylock_nest_lock(lock, nest_lock)		\
+(								\
+	typecheck(struct lockdep_map *, &(nest_lock)->dep_map),	\
+	_mutex_trylock_nest_lock(lock, &(nest_lock)->dep_map)	\
+)
+
+#define mutex_trylock(lock) _mutex_trylock_nest_lock(lock, NULL)
+#else
 extern int mutex_trylock(struct mutex *lock);
+#define mutex_trylock_nest_lock(lock, nest_lock) mutex_trylock(lock)
+#endif
+
 extern void mutex_unlock(struct mutex *lock);
 
 extern int atomic_dec_and_mutex_lock(atomic_t *cnt, struct mutex *lock);
diff --git a/kernel/locking/mutex.c b/kernel/locking/mutex.c
index 555e2b3a665a..c75a838d3bae 100644
--- a/kernel/locking/mutex.c
+++ b/kernel/locking/mutex.c
@@ -1062,6 +1062,7 @@ __ww_mutex_lock_interruptible_slowpath(struct ww_mutex *lock,
 
 #endif
 
+#ifndef CONFIG_DEBUG_LOCK_ALLOC
 /**
  * mutex_trylock - try to acquire the mutex, without waiting
  * @lock: the mutex to be acquired
@@ -1077,18 +1078,25 @@ __ww_mutex_lock_interruptible_slowpath(struct ww_mutex *lock,
  * mutex must be released by the same task that acquired it.
  */
 int __sched mutex_trylock(struct mutex *lock)
+{
+	MUTEX_WARN_ON(lock->magic != lock);
+	return __mutex_trylock(lock);
+}
+EXPORT_SYMBOL(mutex_trylock);
+#else
+int __sched _mutex_trylock_nest_lock(struct mutex *lock, struct lockdep_map *nest_lock)
 {
 	bool locked;
 
 	MUTEX_WARN_ON(lock->magic != lock);
-
 	locked = __mutex_trylock(lock);
 	if (locked)
-		mutex_acquire(&lock->dep_map, 0, 1, _RET_IP_);
+		mutex_acquire_nest(&lock->dep_map, 0, 1, nest_lock, _RET_IP_);
 
 	return locked;
 }
-EXPORT_SYMBOL(mutex_trylock);
+EXPORT_SYMBOL(_mutex_trylock_nest_lock);
+#endif
 
 #ifndef CONFIG_DEBUG_LOCK_ALLOC
 int __sched
-- 
2.46.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
