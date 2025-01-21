Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C16AC02182
	for <kvm-riscv@archiver.kernel.org>; Tue, 21 Jan 2025 15:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nCwSsLF6CRFjFskRzvKarEASsKB6EsOMCpYIURH+08s=; b=YC2gnisHbqUVd5
	MPP7iqW+q30mZw4uJ6FZxxWGE+qGUkjf5+WJrObxaViVGF3CJRMLXLnM7h8Bx0CpTS7jtNSgijzp2
	ibQbnJ8Ra7PD03z238CPEs4VJPI7QUFlH2kjg94A8xs0waI8fb+5ocxY/ORqWpjGHYZPFpsmATKHP
	yXyYURDMn+H/RJ/yt2aAM7WLPmWPGuEs5ERx15wCkIkU9Q5dqOKHzCiMgRpWexHYjH8yAIkslyOdW
	VzbRrOY0SD4lDaucA1TKL7VwKYYTm9yOtpFbBRAhki1X34vwinc5ZG908tJBsBfv4Uoo6Y7XT2kmr
	qrIrpomomnSB6JZ6jCSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taGbi-00000008HMk-16ai;
	Tue, 21 Jan 2025 15:56:02 +0000
Received: from out-184.mta0.migadu.com ([2001:41d0:1004:224b::b8])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taGbf-00000008HLJ-15Yp
	for kvm-riscv@lists.infradead.org;
	Tue, 21 Jan 2025 15:56:01 +0000
Date: Tue, 21 Jan 2025 16:55:48 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1737474951;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kHTOuyrf6b476FzSvoIER5fEZhvPhJ7qECQ1yaBVPL8=;
	b=jLVi0j6635xXGMEyTSFWna0XxMzqF2D1nptRyo0YaJbkTHBxTdhT3652Yr2iFc0Y5suHsA
	4Ei5OyRalZhl/ixQe29WtwJT80HAtPxSaIE95vxNxB08Xo3+igSKAk/Wjly3kv8oY4/7bI
	ptincaA2GFFdsPAgDVzzEIUHWHkOFaM=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: Alexandru Elisei <alexandru.elisei@arm.com>
Cc: eric.auger@redhat.com, lvivier@redhat.com, thuth@redhat.com, 
	frankja@linux.ibm.com, imbrenda@linux.ibm.com, nrb@linux.ibm.com, david@redhat.com, 
	pbonzini@redhat.com, kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	will@kernel.org, julien.thierry.kdev@gmail.com, maz@kernel.org, 
	oliver.upton@linux.dev, suzuki.poulose@arm.com, yuzenghui@huawei.com, joey.gouly@arm.com, 
	andre.przywara@arm.com, Alexandru Elisei <alexandru.elisei@gmail.com>
Subject: Re: [kvm-unit-tests PATCH v2 05/18] scripts: Rename run_qemu_status
 -> run_test_status
Message-ID: <20250121-566d55e720f59e93c88af5e4@orel>
References: <20250120164316.31473-1-alexandru.elisei@arm.com>
 <20250120164316.31473-6-alexandru.elisei@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250120164316.31473-6-alexandru.elisei@arm.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_075559_438104_4AFE3DC2 
X-CRM114-Status: GOOD (  18.84  )
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

On Mon, Jan 20, 2025 at 04:43:03PM +0000, Alexandru Elisei wrote:
> From: Alexandru Elisei <alexandru.elisei@gmail.com>
> 
> For the arm/arm64 architectures, kvm-unit-tests can also be run using the
> kvmtool virtual machine manager. Rename run_qemu_status to run_test_status
> to make it more generic, in preparation to add support for kvmtool.
> 
> Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
> ---
>  arm/run               | 4 ++--
>  powerpc/run           | 2 +-
>  riscv/run             | 4 ++--
>  s390x/run             | 2 +-
>  scripts/arch-run.bash | 2 +-
>  5 files changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/arm/run b/arm/run
> index 6db32cf09c88..9b11feafffdd 100755
> --- a/arm/run
> +++ b/arm/run
> @@ -85,9 +85,9 @@ command+=" -display none -serial stdio"
>  command="$(migration_cmd) $(timeout_cmd) $command"
>  
>  if [ "$UEFI_SHELL_RUN" = "y" ]; then
> -	ENVIRON_DEFAULT=n run_qemu_status $command "$@"
> +	ENVIRON_DEFAULT=n run_test_status $command "$@"
>  elif [ "$EFI_USE_ACPI" = "y" ]; then
> -	run_qemu_status $command -kernel "$@"
> +	run_test_status $command -kernel "$@"
>  else
>  	run_qemu $command -kernel "$@"
>  fi
> diff --git a/powerpc/run b/powerpc/run
> index 27abf1ef6a4d..9b5fbc1197ed 100755
> --- a/powerpc/run
> +++ b/powerpc/run
> @@ -63,4 +63,4 @@ command="$(migration_cmd) $(timeout_cmd) $command"
>  # to fixup the fixup below by parsing the true exit code from the output.
>  # The second fixup is also a FIXME, because once we add chr-testdev
>  # support for powerpc, we won't need the second fixup.
> -run_qemu_status $command "$@"
> +run_test_status $command "$@"
> diff --git a/riscv/run b/riscv/run
> index 73f2bf54dc32..2a846d361a4d 100755
> --- a/riscv/run
> +++ b/riscv/run
> @@ -34,8 +34,8 @@ command+=" $mach $acc $firmware -cpu $processor "
>  command="$(migration_cmd) $(timeout_cmd) $command"
>  
>  if [ "$UEFI_SHELL_RUN" = "y" ]; then
> -	ENVIRON_DEFAULT=n run_qemu_status $command "$@"
> +	ENVIRON_DEFAULT=n run_test_status $command "$@"
>  else
>  	# We return the exit code via stdout, not via the QEMU return code
> -	run_qemu_status $command -kernel "$@"
> +	run_test_status $command -kernel "$@"
>  fi
> diff --git a/s390x/run b/s390x/run
> index 34552c2747d4..9ecfaf983a3d 100755
> --- a/s390x/run
> +++ b/s390x/run
> @@ -47,4 +47,4 @@ command+=" -kernel"
>  command="$(panic_cmd) $(migration_cmd) $(timeout_cmd) $command"
>  
>  # We return the exit code via stdout, not via the QEMU return code
> -run_qemu_status $command "$@"
> +run_test_status $command "$@"
> diff --git a/scripts/arch-run.bash b/scripts/arch-run.bash
> index 8643bab3b252..d6eaf0ee5f09 100644
> --- a/scripts/arch-run.bash
> +++ b/scripts/arch-run.bash
> @@ -75,7 +75,7 @@ run_qemu ()
>  	return $ret
>  }
>  
> -run_qemu_status ()
> +run_test_status ()
>  {
>  	local stdout ret
>  
> -- 
> 2.47.1

Hmm, run_qemu_status() wraps run_qemu() so it seems appropriately named,
especially since the return value of run_qemu() has had QEMU-specific
return codes considered. It seems we should first decouple
run_qemu_status() from run_qemu() or to sanitize run_qemu() of anything
QEMU-specific and rename it to run_test() at the same time.

Thanks,
drew

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
