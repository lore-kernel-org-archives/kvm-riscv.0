Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CBF3C369D9
	for <kvm-riscv@archiver.kernel.org>; Wed, 30 Apr 2025 20:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WL4oWD1/fVfmWpUu1mxb42T2kxagc74X77PPMjO8Wwg=; b=y/WRT6JpjWUcNa
	n2cc9+ZHNKg1CIz8QJW12yn1RvwT6H5CnFtsESfwmgP0mma13Dl+2hGWXyMizLUxS1yl7+n3rZAOL
	BMboUbWmIJJ1MAVdl9KfR20DXnavuk6vrLmsJMVjhL6B70Xt8I2r+cLclWPsUuV823DoJTpAmIwEE
	saZPaCs9uYxdshraVp1UDwv3ow7KyGONl1e98J1Q1TrwEohFuROfpnlCy3kb92Rvn3VlEaxymUhWv
	iHSYz3BNxaTi55uwcL3I7UUNwEtyE3vSCJAfgkOw/eUcxm0VkWXk3IAF5xwrqGNM9kZ0UK+OeQt7L
	Iwze5p9oo6CSY5XTmGLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAEHC-0000000DxXB-3Rn2;
	Wed, 30 Apr 2025 20:43:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAE5B-0000000DvMi-0exO
	for kvm-riscv@bombadil.infradead.org;
	Wed, 30 Apr 2025 20:31:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Content-Type:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=aQUxr5K3/pNESmWjaoZBUh7F903MIT8w03jcc9M9AYg=; b=Ob2odvZxPeUceeTHBFlp1EIIUU
	sOrdAHjwf9KUo7IrNOrrD5OK0clXefpVBefUiB+LgtZo61G/4j8hKzNfJ16F3/bw4cI79mZF5RAU6
	CoMsdJ12nXVYXfZJY+Fk5Xz/L2qCt5CLSoFIgwfnFejoZHMP1oJ3GbbVgzEsIYEk3hNUeZwJ5UBqT
	l0KKrj61JW/roMtzuMix2g27FPIkfD/O/jmgnky8fHchrEd4VvwQzkGNJuWEOdlkN4MtPw8fYOJeY
	8SknY5Q8LieNkbHxTGRuedAnwcUF5y2OW7FhYph1ceJfzjRVhPb1SCjEw82QMg28crMLgZWXUwVM8
	jxnca1NQ==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uAE4k-0000000Dpop-2vSn
	for kvm-riscv@lists.infradead.org;
	Wed, 30 Apr 2025 20:31:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746045033;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=aQUxr5K3/pNESmWjaoZBUh7F903MIT8w03jcc9M9AYg=;
	b=JNp4hloKHq2jcMcEKlqekk7WBVtSkIFq7PcOW60YtRX9EZMZfzKnA7YBru+nFU/KGmndXG
	JmWYr/6ikhtkElfE0X/JZCdl8NVXqzcVJueXIWnrojqI1TDXpxhy9LlYp/MDz244RlhL0b
	w45O2cz8V/W4kCXpXGmDRwRaGmxYJpU=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746045033;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=aQUxr5K3/pNESmWjaoZBUh7F903MIT8w03jcc9M9AYg=;
	b=JNp4hloKHq2jcMcEKlqekk7WBVtSkIFq7PcOW60YtRX9EZMZfzKnA7YBru+nFU/KGmndXG
	JmWYr/6ikhtkElfE0X/JZCdl8NVXqzcVJueXIWnrojqI1TDXpxhy9LlYp/MDz244RlhL0b
	w45O2cz8V/W4kCXpXGmDRwRaGmxYJpU=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-177-TqW5oqXPPQS0_3qrbhafRw-1; Wed,
 30 Apr 2025 16:30:27 -0400
X-MC-Unique: TqW5oqXPPQS0_3qrbhafRw-1
X-Mimecast-MFC-AGG-ID: TqW5oqXPPQS0_3qrbhafRw_1746045022
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 72CF7180098F;
	Wed, 30 Apr 2025 20:30:21 +0000 (UTC)
Received: from intellaptop.lan (unknown [10.22.80.5])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 99F381800871;
	Wed, 30 Apr 2025 20:30:14 +0000 (UTC)
From: Maxim Levitsky <mlevitsk@redhat.com>
To: kvm@vger.kernel.org
Cc: linux-riscv@lists.infradead.org,
	Kunkun Jiang <jiangkunkun@huawei.com>,
	Waiman Long <longman@redhat.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Borislav Petkov <bp@alien8.de>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Anup Patel <anup@brainfault.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Alexander Potapenko <glider@google.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Andre Przywara <andre.przywara@arm.com>,
	x86@kernel.org,
	Joey Gouly <joey.gouly@arm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	kvm-riscv@lists.infradead.org,
	Atish Patra <atishp@atishpatra.org>,
	Ingo Molnar <mingo@redhat.com>,
	Jing Zhang <jingzhangos@google.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	kvmarm@lists.linux.dev,
	Will Deacon <will@kernel.org>,
	Keisuke Nishimura <keisuke.nishimura@inria.fr>,
	Sebastian Ott <sebott@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Shusen Li <lishusen2@huawei.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Marc Zyngier <maz@kernel.org>,
	Maxim Levitsky <mlevitsk@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH v4 0/5] KVM: lockdep improvements
Date: Wed, 30 Apr 2025 16:30:08 -0400
Message-ID: <20250430203013.366479-1-mlevitsk@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_213100_565467_4E33E885 
X-CRM114-Status: UNSURE (   9.59  )
X-CRM114-Notice: Please train this message.
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

Maxim Levitsky (5):
  locking/mutex: implement mutex_trylock_nested
  arm64: KVM: use mutex_trylock_nest_lock when locking all vCPUs
  RISC-V: KVM: switch to kvm_trylock/unlock_all_vcpus
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
 include/linux/mutex.h                 | 32 ++++++++++--
 kernel/locking/mutex.c                | 21 +++++---
 virt/kvm/kvm_main.c                   | 59 ++++++++++++++++++++++
 12 files changed, 126 insertions(+), 170 deletions(-)

-- 
2.46.0



-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
