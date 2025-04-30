Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA1AAC369DC
	for <kvm-riscv@archiver.kernel.org>; Wed, 30 Apr 2025 20:25:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=G/aBpqM9yVUoduUcoKBrN90LFF6dmc9q+GK0p4pBPQo=; b=xN2IzfwBaIeU2/
	pvkwu/WGqawJNiIqPTjkqkMv5Hf7F8VnveQEg6SkN4xFSag1qWHlfQjlsEBW2k6jpHGDAi3sJ+f3J
	5jMastE0R9C99gs6W1VUv4DtKJNEPh/mO60eMDg1Ur+kTDp//VYB0j2BBbsCYdkEYRhHPTYkeIfvU
	DYI6yu8HYs7M6r0yfv/tJ4YHIDNG40/1Wq/l1Okk79W/FodbJ07KnsnytP+brQx8eejX0b1YPXcjK
	WyVPhsJ8gsLkXEYV18dY1hzIXPQ/xDCvgIBaCMx65HOAYEZX0pa+MEg17GYin3qVrAoCChCorJJLQ
	QjJ1I1/LW1emzre/3Z4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAE00-0000000DubM-01fr;
	Wed, 30 Apr 2025 20:25:44 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uADy0-0000000Dtza-3XjN
	for kvm-riscv@lists.infradead.org;
	Wed, 30 Apr 2025 20:23:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746044619;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ueORBRSdk8dfevMNCiszlxJFROHE0iUZRTzx7EwVQFc=;
	b=e7rcmfj71/05qamlZb1tz8MT60ZonDe2jGQn6uf4CKE2uwPIZnWH1Oy3wOwkLkY9biJgKM
	0aXy1ZO97qDMXJnXPJL4m9t0Qe6fg1px8L/las9456AMzS/tYxOUhl2KFN1gtmxWBX7Brb
	YLX2yf43t2KpKa2BDT+zkLkHf8EFPQg=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-343-Y91AxpyiOD2kIYc-u3Pg8Q-1; Wed,
 30 Apr 2025 16:23:34 -0400
X-MC-Unique: Y91AxpyiOD2kIYc-u3Pg8Q-1
X-Mimecast-MFC-AGG-ID: Y91AxpyiOD2kIYc-u3Pg8Q_1746044610
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 5EAD11955D77;
	Wed, 30 Apr 2025 20:23:22 +0000 (UTC)
Received: from intellaptop.lan (unknown [10.22.80.5])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id E1C381800365;
	Wed, 30 Apr 2025 20:23:11 +0000 (UTC)
From: Maxim Levitsky <mlevitsk@redhat.com>
To: kvm@vger.kernel.org
Cc: "H. Peter Anvin" <hpa@zytor.com>,
	x86@kernel.org,
	Maxim Levitsky <mlevitsk@redhat.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Will Deacon <will@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Kunkun Jiang <jiangkunkun@huawei.com>,
	Jing Zhang <jingzhangos@google.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Keisuke Nishimura <keisuke.nishimura@inria.fr>,
	Anup Patel <anup@brainfault.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Atish Patra <atishp@atishpatra.org>,
	kvmarm@lists.linux.dev,
	Waiman Long <longman@redhat.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	Peter Zijlstra <peterz@infradead.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Sebastian Ott <sebott@redhat.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Ingo Molnar <mingo@redhat.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Borislav Petkov <bp@alien8.de>,
	Sean Christopherson <seanjc@google.com>,
	Marc Zyngier <maz@kernel.org>,
	Alexander Potapenko <glider@google.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Shusen Li <lishusen2@huawei.com>,
	kvm-riscv@lists.infradead.org
Subject: [PATCH v3 0/4] KVM: lockdep improvements
Date: Wed, 30 Apr 2025 16:23:07 -0400
Message-ID: <20250430202311.364641-1-mlevitsk@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_132340_957473_B0C95374 
X-CRM114-Status: GOOD (  10.21  )
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

This is	a continuation of my 'extract lock_all_vcpus/unlock_all_vcpus'
patch series.

Implement the suggestion of using lockdep's "nest_lock" feature
when locking all KVM vCPUs by adding mutex_trylock_nest_lock() and
mutex_lock_killable_nest_lock() and use these functions	in the
implementation of the
kvm_trylock_all_vcpus()/kvm_lock_all_vcpus()/kvm_unlock_all_vcpus().

Those changes allow removal of a custom workaround that was needed to
silence the lockdep warning in the SEV code and also stop lockdep from
complaining in case of ARM and RISC-V code which doesn't include the above
mentioned workaround.

Finally, it's worth noting that this patch series removes a fair
amount of duplicate code by implementing the logic in one place.

Best regards,
	Maxim Levitsky

Maxim Levitsky (4):
  arm64: KVM: use mutex_trylock_nest_lock when locking all vCPUs
  RISC-V: KVM: switch to kvm_lock/unlock_all_vcpus
  locking/mutex: implement mutex_lock_killable_nest_lock
  x86: KVM: SEV: implement kvm_lock_all_vcpus and use it

 arch/arm64/include/asm/kvm_host.h     |  3 --
 arch/arm64/kvm/arch_timer.c           |  4 +-
 arch/arm64/kvm/arm.c                  | 43 ----------------
 arch/arm64/kvm/vgic/vgic-init.c       |  4 +-
 arch/arm64/kvm/vgic/vgic-its.c        |  8 +--
 arch/arm64/kvm/vgic/vgic-kvm-device.c | 12 ++---
 arch/riscv/kvm/aia_device.c           | 34 +------------
 arch/x86/kvm/svm/sev.c                | 72 ++-------------------------
 include/linux/kvm_host.h              |  4 ++
 include/linux/mutex.h                 | 17 +++++--
 kernel/locking/mutex.c                |  7 +--
 virt/kvm/kvm_main.c                   | 59 ++++++++++++++++++++++
 12 files changed, 100 insertions(+), 167 deletions(-)

-- 
2.46.0



-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
