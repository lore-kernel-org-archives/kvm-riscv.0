Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9AFFC83F04
	for <kvm-riscv@archiver.kernel.org>; Wed,  2 Jul 2025 14:37:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OvyyZVd1AqxocxtwFLf20PdAATDY5SuN5hlxOt9yl0Y=; b=qyFFip8sjvGF0V
	HQqQ0IyZIF/4yrXSZ2mw0lh1sv7Cqcwq2PC/mI2PfjykhTsAW3r47rdpFSy11aYuxhwO2j6cy08V0
	kWn08OOwp2nfck21cn4fidq7SDvza9ZIt5tsGYXAzsOus/JyJZ8w+7V1IkUaCOKfZYHDNlm0beiaq
	1qZKzeQZEz4mtLBl7ykHT9Vh5j9ilMA4H4sLFl+kfKHI4xtyGr/dBVEuu+sbb2tjLpPYdRMbqehzx
	rPTvYxu12twdMXbTGRP584vwLKVefkSK0AlruySF9H8SOb611mYojSct6bfxqTR42KvtacCDh3zPa
	kbyenz9yBY5/K8mKwsAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWyag-00000008eBE-2fgy;
	Wed, 02 Jul 2025 14:37:38 +0000
Received: from out-178.mta1.migadu.com ([95.215.58.178])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWxSg-00000008Rih-1fBj
	for kvm-riscv@lists.infradead.org;
	Wed, 02 Jul 2025 13:25:20 +0000
Date: Wed, 2 Jul 2025 15:25:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1751462716;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2AtJHOMqWJ6F384E1w5rTvvzxDPe7+FoXKxbqUWmqh0=;
	b=fEcHzlCzoPeE8qMosDj/PqdbnAnnkrLQNiWkgozTiYWQq6moOFQNZ4ULGlSvdSNKqwQ4S9
	nMXZblScAuwIsDzDRl15678OpFRLRdgz43IY9yL+B+sgJrH05LN+7X+kCVgKG4C/cwuq8I
	Jkon6MWpJl2/v5wgBBDf4twpORJobbg=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: Alexandru Elisei <alexandru.elisei@arm.com>
Cc: eric.auger@redhat.com, lvivier@redhat.com, thuth@redhat.com, 
	frankja@linux.ibm.com, imbrenda@linux.ibm.com, nrb@linux.ibm.com, david@redhat.com, 
	pbonzini@redhat.com, kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	will@kernel.org, julien.thierry.kdev@gmail.com, maz@kernel.org, 
	oliver.upton@linux.dev, suzuki.poulose@arm.com, yuzenghui@huawei.com, joey.gouly@arm.com, 
	andre.przywara@arm.com, shahuang@redhat.com
Subject: Re: [kvm-unit-tests PATCH v4 00/13] arm/arm64: Add kvmtool to the
 runner script
Message-ID: <20250702-c37fbf095d2665019da2c037@orel>
References: <20250625154813.27254-1-alexandru.elisei@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250625154813.27254-1-alexandru.elisei@arm.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_062518_734407_C73979D7 
X-CRM114-Status: GOOD (  34.75  )
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

Hi Paolo, Thomas, and others,

This series has a subject of arm, but it makes lots of changes to
common scripts. Can I get an ack on it? I'd like to merge it.

Thanks,
drew


On Wed, Jun 25, 2025 at 04:48:00PM +0100, Alexandru Elisei wrote:
> v3 can be found here [1]. Based on top of the series that add qemu_params and
> test_args [2].
> 
> To goal is to allow the user to do:
> 
> $ ./configure --target=kvmtool
> $ make clean && make
> $ ./run_tests.sh
> 
> to run all the tests automatically with kvmtool.
> 
> Reasons to use kvmtool:
> 
> * kvmtool is smaller and a lot easier to modify compared to qemu, which
> means developers may prefer it when adding or prototyping new features to
> KVM, and being able to run all the tests reliably and automatically is very
> useful.
> 
> * kvmtool is faster to run the tests (a couple of times faster on
> my rockpro64), making for a quick turnaround. But do keep in mind that not
> all tests work on kvmtool because of missing features compared to qemu.
> 
> * kvmtool does things differently than qemu: different memory layout,
> different uart, PMU emulation is disabled by default, etc. This makes it a
> good testing vehicule for kvm-unit-tests itself.
> 
> Changes v3->v4
> --------------
> 
> Overview of the changes:
> 
> * Gathered Reviewed-by tags - thanks for the review!
> 
> * Sent patches #1 ("scripts: unittests.cfg: Rename 'extra_params' to
> 'qemu_params'") and #2 ("scripts: Add 'test_args' test definition parameter")
> as a separate series.
> 
> * Fixed the typos reported during the review.
> 
> * Ran shellcheck on the patches, this resulted in minor changes.
> 
> * Dropped patch "configure: Export TARGET unconditionally" - now the functions
> in vmm.bash will check if TARGET is set, instead of having the other scripts use
> $TARGET to directly index the vmm_opts array.
> 
> * Direct reads of $TARGET have been replaced with vmm_get_target(), to account
> for the fact that most architectures don't configure $TARGET (only arm and
> arm64 do that).
> 
> * Renamed check_vmm_supported() to vmm_check_supported() to match the
> function names introduced in subsequent patches.
> 
> * Renamed vmm_opts->vmm_optname to match the new function names.
> 
> * Reordered the key-value pairs from vmm_optname in alphabetical order.
> 
> * Use the "," separator for the composite keys of the associative array instead
> of ":" (don't remember why I originally settled on ":", but it was a really poor
> choice).
> 
> * Dropped the Reviewed-by tags from Drew and Shaoqin Huang from patch #6
> ("scripts: Use an associative array for qemu argument names") - the review is
> much appreciated, but the way the vmm_opts array (now renamed to vmm_optname) is
> created, and used, has changed, and since the patch is about introducing the
> associative array, I thought it would be useful to have another round of review.
> 
> * Use functions instead of indexing vmm_opts (now vmm_optname) directly.
> 
> * Fixed standalone test generation by removing 'source vmm.bash' from
> scripts/arch-run.bash, $arch/run and scripts/runtime, and having
> scripts/mkstandalone.sh::generate_test() copy it directly in the final test
> script. Didn't catch that during the previous iterations because I was
> running the standalone tests from the top level source directory, and
> "source scripts/vmm.bash" happened to work.
> 
> More details in the changelog for the modified patches.
> 
> [1] https://lore.kernel.org/kvm/20250507151256.167769-1-alexandru.elisei@arm.com/
> [2] https://lore.kernel.org/kvm/20250625154354.27015-1-alexandru.elisei@arm.com/
> 
> Alexandru Elisei (13):
>   run_tests.sh: Document --probe-maxsmp argument
>   scripts: Document environment variables
>   scripts: Refuse to run the tests if not configured for qemu
>   scripts: Use an associative array for qemu argument names
>   scripts: Add 'kvmtool_params' to test definition
>   scripts: Add support for kvmtool
>   scripts: Add default arguments for kvmtool
>   scripts: Add KVMTOOL environment variable for kvmtool binary path
>   scripts: Detect kvmtool failure in premature_failure()
>   scripts: Do not probe for maximum number of VCPUs when using kvmtool
>   scripts/mkstandalone: Export $TARGET
>   scripts: Add 'disabled_if' test definition parameter for kvmtool to
>     use
>   scripts: Enable kvmtool
> 
>  README.md               |  18 +++-
>  arm/efi/run             |   8 ++
>  arm/run                 | 161 ++++++++++++++++-----------
>  arm/unittests.cfg       |  31 ++++++
>  configure               |   1 -
>  docs/unittests.txt      |  26 ++++-
>  powerpc/run             |   5 +-
>  riscv/run               |   5 +-
>  run_tests.sh            |  35 +++---
>  s390x/run               |   3 +-
>  scripts/arch-run.bash   | 112 +++++++------------
>  scripts/common.bash     |  30 ++++--
>  scripts/mkstandalone.sh |   8 +-
>  scripts/runtime.bash    |  35 ++----
>  scripts/vmm.bash        | 234 ++++++++++++++++++++++++++++++++++++++++
>  x86/run                 |   5 +-
>  16 files changed, 525 insertions(+), 192 deletions(-)
>  create mode 100644 scripts/vmm.bash
> 
> -- 
> 2.50.0
> 
> 
> -- 
> kvm-riscv mailing list
> kvm-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/kvm-riscv

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
