Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF674C7EE3A
	for <kvm-riscv@archiver.kernel.org>; Wed, 25 Jun 2025 19:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=SvV5K+fXThGfoU7Vw+Wd8PeX3AtSsfxXKI5Xi2NZHyQ=; b=agxZRY4UNQd1l3
	8dSgS2w/bSWJrornuzq0KaWX5ZEUpKTiSeMiW3eKMFSiWfB5uhNBvvQ9zaQ+uMvNXsxQuoBtJZxJt
	Sty8foqgtiZ8fLxdZtfjmMF91Z0ekr8oWcNbUMno7tcObnM4dtCdl4xgnVLPy8SuBmEmrJcjNOgm5
	fqKQ+GvqHHEHs/B6CRdL6IjJLRtwdLULcfyXTJKSsODb6US4mTHeiAvxdyO7wdfvAiTp4/Q/dV5gP
	0ZvbjxaOmTtD9qN+vN7PSyS/FBLzJb3tY1/kWScsczvbh+hg973BRT1bvjEIskBPOhLDXuT/QHpww
	XvtYjrXcGX941tSPsD7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUVxL-00000009lRA-3w8o;
	Wed, 25 Jun 2025 19:38:51 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUSID-000000099gV-1lFX
	for kvm-riscv@lists.infradead.org;
	Wed, 25 Jun 2025 15:44:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8B91E106F;
	Wed, 25 Jun 2025 08:43:48 -0700 (PDT)
Received: from raptor (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C26323F58B;
	Wed, 25 Jun 2025 08:44:03 -0700 (PDT)
From: Alexandru Elisei <alexandru.elisei@arm.com>
To: kvm@vger.kernel.org,
	andrew.jones@linux.dev,
	lvivier@redhat.com,
	thuth@redhat.com,
	frankja@linux.ibm.com,
	imbrenda@linux.ibm.com,
	nrb@linux.ibm.com,
	pbonzini@redhat.com,
	alexandru.elisei@arm.com,
	eric.auger@redhat.com,
	kvmarm@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	kvm-riscv@lists.infradead.org,
	david@redhat.com,
	linux-s390@vger.kernel.org
Subject: [kvm-unit-tests PATCH 0/2] scripts: extra_params rework
Date: Wed, 25 Jun 2025 16:43:52 +0100
Message-ID: <20250625154354.27015-1-alexandru.elisei@arm.com>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_084409_496722_E4E56909 
X-CRM114-Status: UNSURE (   8.72  )
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

This series was split from the series that adds support to use kvmtool when
using the scripts to run the tests [1]. kvmtool will be supported only for arm
and arm64, as they are the only architectures that compile the tests to run with
kvmtool.

The justification for these changes is to be able to introduce
kvmtool_params for kvmtool specific command line options, and to make a
clear distinction between the qemu options and the kvmtool options. This is
why qemu_params was added as a replacement for extra_params. extra_params
was kept for compatibility purposes for user's custom test definitions.

To avoid duplication of the arguments that are passed to a test's main()
function, test_args has been split from qemu_params. The same test_args
will be used by both qemu and kvmtool.

[1] https://lore.kernel.org/kvm/20250507151256.167769-1-alexandru.elisei@arm.com/

Alexandru Elisei (2):
  scripts: unittests.cfg: Rename 'extra_params' to 'qemu_params'
  scripts: Add 'test_args' test definition parameter

 arm/unittests.cfg     |  94 ++++++++++++++----------
 docs/unittests.txt    |  30 +++++---
 powerpc/unittests.cfg |  21 +++---
 riscv/unittests.cfg   |   2 +-
 s390x/unittests.cfg   |  53 +++++++-------
 scripts/common.bash   |  16 +++--
 scripts/runtime.bash  |  24 ++++---
 x86/unittests.cfg     | 164 ++++++++++++++++++++++++------------------
 8 files changed, 237 insertions(+), 167 deletions(-)


base-commit: 507612326c9417b6330b91f7931678a4c6866395
-- 
2.50.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
