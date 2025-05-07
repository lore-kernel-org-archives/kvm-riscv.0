Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CB49C3ABC5
	for <kvm-riscv@archiver.kernel.org>; Wed,  7 May 2025 15:48:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=357IaKwmIpymd2NPNTU+G+QzX2XqP/oFFiWvDMt8QOo=; b=hg2KYdfJjT4bEX
	7fLnBDodSjzUIT9samHg9QpRFDi9WkqZamudJY3/NpgWM52eY/fAjmQLn4drAYQZiJGAcve8MXlf4
	FKTmaqfdDPI1OHGDpdAvm+yiY0oogrYfSOcFtR8+HA+oMXRziwZxC5vVMBdIKO8xOLvdO0DkQouba
	I67ilqiG3zj6ZZgJZHKM9Z2rY45j5jtKkBoVMIvlnq/Ixi5kUHLcFAShPMMaDj8C40VCD5vYd0l9f
	WvZFhSJjTbV+DQQ/lcMzWZdV6MwhCWnUYfKakbH28nnJkvD75aVYWgotab+uceyYkPdlHcZ7PMeKZ
	oFQUOjo8uti1W2G2lqcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCh0v-0000000G2FL-17So;
	Wed, 07 May 2025 15:48:53 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCgSW-0000000FupJ-2MLO
	for kvm-riscv@lists.infradead.org;
	Wed, 07 May 2025 15:13:21 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 367FB339;
	Wed,  7 May 2025 08:13:03 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2C7783F58B;
	Wed,  7 May 2025 08:13:10 -0700 (PDT)
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
Subject: [kvm-unit-tests PATCH v3 00/16] arm/arm64: Add kvmtool to the runner script
Date: Wed,  7 May 2025 16:12:40 +0100
Message-ID: <20250507151256.167769-1-alexandru.elisei@arm.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_081320_699860_35C4BBA9 
X-CRM114-Status: GOOD (  20.45  )
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

v2 can be found here [1].

To goal is to allow the user to do:

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

Changes in v3
-------------

Lots of changes following the excellent feedback I got. A bird's eye view:

* Split extra_params into qemu_params and test_args: qemu_params for qemu
arguments and test_args for the test's main() function.

Now that I'm putting the cover letter together I'm considering that maybe
having qemu_params, kvmtool_params and test_params (instead of test_args)
might be a better naming scheme.

* TARGET is now exported unconditionally. Unfortunately a side effect of
this is that checking out these series and running the tests will end up
with an error because the scripts now expect TARGET to be defined in
config.mak.

If it's unacceptable, I can drop this and handle everything in vmm.bash by
converting direct accesses to vmm_opts with functions defined in vmm.bash
(vmm_opts[$TARGET:parse_premature_failure] becomes
vmm_parse_premature_failure(), for example).

* Introduced scripts/vmm.bash to keep the vmm stuff contained. As a
consequence there's very little $TARGET stuff in scripts/runtime.bash (only
for premature_failure(), and no more 'case' statements anywhere) and
instead scripts/common.bash passes the correct arguments directly to
runtime.bash::run().

Unfortunately, because of all the changes, I decided not to keep some of
the Reviewed-by tags. That's not to say that the effort is not appreciated,
on the contrary, these changes are a direct result of the review; I dropped
the tags because I was worried they might not apply to the current content
of the patches.

If no major changes are needed following this round of review, for the next
iteration I'm planning to send the first two patches (extra_params renamed
to qemu_params and the new test_args) separately, to make sure it gets the
review it deserves from the rest of the architectures.

Still haven't managed to get EDK2 to work with kvmtool, so I've decided to
explicitely disabled UEFI tests in the last patch ("scripts: Enable
kvmtool") - this is new.

I would also like to point out that despite Drew's comment I kept the
'disabled_if' test definition because I think using 'targets', with the
default value of 'qemu', will probably lead to most, if not all, of the new
tests which will be added never being run or tested with kvmtool. More
details in patch #15 ("scripts: Add 'disabled_if' test definition parameter
for kvmtool to use").

[1] https://lore.kernel.org/kvm/20250120164316.31473-1-alexandru.elisei@arm.com/

Alexandru Elisei (16):
  scripts: unittests.cfg: Rename 'extra_params' to 'qemu_params'
  scripts: Add 'test_args' test definition parameter
  configure: Export TARGET unconditionally
  run_tests.sh: Document --probe-maxsmp argument
  scripts: Document environment variables
  scripts: Refuse to run the tests if not configured for qemu
  scripts: Use an associative array for qemu argument names
  scripts: Add 'kvmtool_params' to test definition
  scripts: Add support for kvmtool
  scripts: Add default arguments for kvmtool
  scripts: Add KVMTOOL environment variable for kvmtool binary path
  scripts: Detect kvmtool failure in premature_failure()
  scripts: Do not probe for maximum number of VCPUs when using kvmtool
  scripts/mkstandalone: Export $TARGET
  scripts: Add 'disabled_if' test definition parameter for kvmtool to
    use
  scripts: Enable kvmtool

 README.md               |  18 ++++-
 arm/efi/run             |   8 ++
 arm/run                 | 161 +++++++++++++++++++++++--------------
 arm/unittests.cfg       | 125 ++++++++++++++++++++---------
 configure               |  37 ++++++---
 docs/unittests.txt      |  54 +++++++++++--
 powerpc/run             |   4 +-
 powerpc/unittests.cfg   |  21 ++---
 riscv/run               |   4 +-
 riscv/unittests.cfg     |   2 +-
 run_tests.sh            |  35 ++++++---
 s390x/run               |   2 +-
 s390x/unittests.cfg     |  53 +++++++------
 scripts/arch-run.bash   | 113 ++++++++++----------------
 scripts/common.bash     |  71 +++++++++++------
 scripts/mkstandalone.sh |   4 +
 scripts/runtime.bash    |  51 +++++-------
 scripts/vmm.bash        | 170 ++++++++++++++++++++++++++++++++++++++++
 x86/run                 |   4 +-
 x86/unittests.cfg       | 164 +++++++++++++++++++++-----------------
 20 files changed, 730 insertions(+), 371 deletions(-)
 create mode 100644 scripts/vmm.bash


base-commit: 08db0f5cfbca16b36f200b7bc54a78fa4941bcce
-- 
2.49.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
