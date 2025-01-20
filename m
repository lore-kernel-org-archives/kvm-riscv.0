Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92F7BC02182
	for <kvm-riscv@archiver.kernel.org>; Mon, 20 Jan 2025 16:43:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=z3L44uUyaFEupRIiUcpipy9+8spi2VH5VESIJbZ8abk=; b=qFtMLHWfBuj99a
	9m1hu5f8FA9WdtHAK+o7H6ACZJHzmXmArceWztdeftF0Zdx77+V/+Yp39IiyUU9RGbIgXrlVw8Mgz
	590rBi2vFMDnlrUyrbtbCI37Re8d9PIzdeyiyZJMetqOo2diGdlbLH5oNGZwfTTpOcZbpx6H9glv6
	LJmxYHUaxKNFZJsHCBizX/Dnd9z8DxAYJEQUCV9OSfE5VIbIZb30S+gKiA1r/w5VILO/zaqTFU9ms
	5Td3N/UnFLcnHQqSN0KUIyIZ1aH++1/bSz8ofxRN7rN9Dit22P+CcEV/n1lqKPQ/kOdvv4dE+4shQ
	4ppu0ox2U61F/1kX68qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZusF-000000061ft-07xK;
	Mon, 20 Jan 2025 16:43:39 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZusC-000000061fB-14Ix
	for kvm-riscv@lists.infradead.org;
	Mon, 20 Jan 2025 16:43:37 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A5758FEC;
	Mon, 20 Jan 2025 08:44:00 -0800 (PST)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 081F73F5A1;
	Mon, 20 Jan 2025 08:43:28 -0800 (PST)
From: Alexandru Elisei <alexandru.elisei@arm.com>
To: andrew.jones@linux.dev,
	eric.auger@redhat.com,
	lvivier@redhat.com,
	thuth@redhat.com,
	frankja@linux.ibm.com,
	imbrenda@linux.ibm.com,
	nrb@linux.ibm.com,
	david@redhat.com,
	pbonzini@redhat.com
Cc: kvm@vger.kernel.org,
	kvmarm@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	kvm-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	will@kernel.org,
	julien.thierry.kdev@gmail.com,
	maz@kernel.org,
	oliver.upton@linux.dev,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	joey.gouly@arm.com,
	andre.przywara@arm.com
Subject: [kvm-unit-tests PATCH v2 00/18] arm/arm64: Add kvmtool to the runner script
Date: Mon, 20 Jan 2025 16:42:58 +0000
Message-ID: <20250120164316.31473-1-alexandru.elisei@arm.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250120_084336_382271_8E0328AA 
X-CRM114-Status: GOOD (  20.86  )
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

Finally got fed up with manually running a test with kvmtool, so I've
decided to send v2 of the series [1] that adds kvmtool support to
run_tests.sh. The series has significantly more patches now, but that's
mostly because I split a large patch into several smaller ones (as per
Andre's suggestion), which I hope will make reviewing easier. Because of
this I removed two Reviewed-by tags from Drew and Thomas Huth - your review
is much appreciated!

To goal is to have an user do:

$ ./configure --target=kvmtool
$ make clean && make
$ ./run_tests.sh

to run all the tests automatically with kvmtool.

Reasons to use kvmtool:

* kvmtool is smaller and a lot easier to hack than qemu, which means
developers may prefer it when adding or prototyping new features to KVM.
Being able to run all the tests reliably and automatically is very useful
in the development process.

* kvmtool is faster to run the tests (a couple of times faster on
my rockpro64), making for a quick turnaround. But do keep in mind that not
all tests work on kvmtool because of missing features compared to qemu.

* kvmtool does things differently than qemu: different memory layout,
different uart, PMU emulation is disabled by default, etc. This makes it a
good testing vehicule for kvm-unit-tests itself.

The series has been rewritten since v1 [1]. This is a brief overview of the
major changes:

* Split into smaller patches.
* Document environment variables and --probe-maxsmp options.
* New unittest parameter, qemu_params, to replace extra_params going
forward (extra_params has been kept for compatibility)
* New unittest parameter, kvmtool_params, for kvmtool specific arguments
needed to run a test.
* New unittest parameter, disabled_if, to disable a test that cannot run
under kvmtool.

I would very much like more input regarding disabled_if. Allows all sorts
of combinations, like:

[ "$TARGET" = kvmtool ] && ([ -z "$CONFIG_EFI" ] || [ "$CONFIG_EFI" = n ])

and that's because it's evaluated as-is in a bash if statement - might have
security implications. I could have just added something like
supported_vmms, but I thought the current approach looks more flexible.
Although that might just be premature optimization.

There's only one limitation as far as I know - UEFI tests don't work. I
tried to run a .efi test with kvmtool manually, but kvmtool froze and I
didn't get any output. I am not familiar with EDK2, so I thought I can send
the this series and get feedback on it while I make time to figure out what
is going on - it might be something with kvm-unit-tests, EDK2, kvmtool, or
a combination of them. And I don't think UEFI support is very important at
the moment, no distro ships a EDK2 binary compiled for kvmtool so I don't
think there would be many users for it.

[1] https://lore.kernel.org/kvm/20210702163122.96110-1-alexandru.elisei@arm.com/

Please review,
Alex

Alexandru Elisei (18):
  run_tests: Document --probe-maxsmp argument
  Document environment variables
  scripts: Refuse to run the tests if not configured for qemu
  run_tests: Introduce unittest parameter 'qemu_params'
  scripts: Rename run_qemu_status -> run_test_status
  scripts: Merge the qemu parameter -smp into $qemu_opts
  scripts: Introduce kvmtool_opts
  scripts/runtime: Detect kvmtool failure in premature_failure()
  scripts/runtime: Skip test when kvmtool and $accel is not KVM
  scripts/arch-run: Add support for kvmtool
  arm/run: Add support for kvmtool
  scripts/runtime: Add default arguments for kvmtool
  run_tests: Do not probe for maximum number of VCPUs when using kvmtool
  run_tests: Add KVMTOOL environment variable for kvmtool binary path
  Add kvmtool_params to test specification
  scripts/mkstandalone: Export $TARGET
  unittest: Add disabled_if parameter and use it for kvmtool
  run_tests: Enable kvmtool

 arm/efi/run             |   8 ++
 arm/run                 | 164 +++++++++++++++++++++++++---------------
 arm/unittests.cfg       |  34 +++++++++
 docs/unittests.txt      |  43 +++++++++--
 powerpc/run             |   2 +-
 riscv/run               |   4 +-
 run_tests.sh            |  50 ++++++++----
 s390x/run               |   2 +-
 scripts/arch-run.bash   |  80 ++++++++++++++++++--
 scripts/common.bash     |  63 +++++++++------
 scripts/mkstandalone.sh |   9 +++
 scripts/runtime.bash    |  64 +++++++++++++---
 12 files changed, 399 insertions(+), 124 deletions(-)


base-commit: 0ed2cdf3c80ee803b9150898e687e77e4d6f5db2
-- 
2.34.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
