Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4E18CAC582
	for <kvm-riscv@archiver.kernel.org>; Tue,  9 Sep 2025 02:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=otIz/BIZayVIcCKwFnp2YZxG17UJYWBT3MBy87FnDRI=; b=wRhUoVoFuPxOdx
	h5ysXlGcGii4PPifsqEidCKxrggj1XtuMfSmPBK0moOSpxtzMhrOzjlIUFdKGfssn3lIY+tg8qCYU
	OPcyDuueMZ9hPKf12oOCk3H+1pGYw47hTsfmfHnZqG8fOsHsIDBSExzf1z44nWQV/YLypZCsShP+l
	wneO1m5D7Lw7uQcNL3scdC1wQmzQOqMuFVkHKhgevD8JYLdnCL1oQ12iUvABqUbFxV4D6Orv1u0LI
	7wEmhtpwfN47ekeAxDHP/qpTCdzC7hwrkvJCqG0JkDApkdpVsCC4n9M7HuCbH09oXTYSMo/HJTZ1i
	MNdZCOBt55wngl07wQhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvo5n-00000003gvq-1g6v;
	Tue, 09 Sep 2025 02:28:23 +0000
Received: from out-179.mta0.migadu.com ([2001:41d0:1004:224b::b3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvgWz-00000001X6r-32Dl
	for kvm-riscv@lists.infradead.org;
	Mon, 08 Sep 2025 18:23:58 +0000
Date: Mon, 8 Sep 2025 13:23:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1757355818;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wfvbyRUrus9DdcW9zzI7on+fJXo5hCh3vG+emK2AfHg=;
	b=hr0MirQCQnOn5qgB12A20Crtc/ogkmtkyeS6UzFumatxvYvHFDpT/b/4H2BTtwjguNtujd
	GbhgrR09+x6HdohMi6e4Nr4/TLPzR9gNJOl5O8BxnVyg2q4lnxNWyjCPc0QkwTC7ukR6Yl
	LW7UOuyJ3BFDBcaDtuFsO3v7Fl/dfjU=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: Nicholas Piggin <npiggin@gmail.com>
Cc: kvm@vger.kernel.org, Shaoqin Huang <shahuang@redhat.com>, 
	Alexandru Elisei <alexandru.elisei@arm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Thomas Huth <thuth@redhat.com>, Sean Christopherson <seanjc@google.com>, 
	kvm-riscv@lists.infradead.org, Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH 2/2] shellcheck: suppress SC2327,2328 false positives
Message-ID: <20250908-d271d19e8179dae99c23143f@orel>
References: <20250908010618.440178-1-npiggin@gmail.com>
 <20250908010618.440178-2-npiggin@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250908010618.440178-2-npiggin@gmail.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_112357_899993_F5473379 
X-CRM114-Status: GOOD (  20.34  )
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

On Mon, Sep 08, 2025 at 11:06:18AM +1000, Nicholas Piggin wrote:
> Shellcheck warnings SC2327,SC2328 complain that a command substitution
> will be empty if the output is redirected, which is a valid warning but
> shellcheck is not smart enough to see when output is redirected into a
> command that outputs what the command substitution wanted.
> 
> Add comments and shellcheck directives to these cases.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>  scripts/arch-run.bash | 9 +++++++++
>  scripts/runtime.bash  | 6 ++++++
>  2 files changed, 15 insertions(+)
> 
> diff --git a/scripts/arch-run.bash b/scripts/arch-run.bash
> index 58e4f93f..9c089f88 100644
> --- a/scripts/arch-run.bash
> +++ b/scripts/arch-run.bash
> @@ -9,6 +9,11 @@ run_test ()
>  
>  	# stdout to {stdout}, stderr to $errors and stderr
>  	exec {stdout}>&1
> +	# SC complains that redirection without tee takes output way from

s/way/away/

Same comment for the other uses below.

> +	# command substitution, but that is what we want here (stderr output
> +	# does go to command substitution because tee is used, but stdout does
> +	# not).
> +	# shellcheck disable=SC2327,SC2328
>  	errors=$("${@}" $INITRD </dev/null 2> >(tee /dev/stderr) > /dev/fd/$stdout)
>  	ret=$?
>  	exec {stdout}>&-
> @@ -23,6 +28,10 @@ run_test_status ()
>  	local stdout ret
>  
>  	exec {stdout}>&1
> +	# SC complains that redirection without tee takes output way from
> +	# command substitution, but that is what we want here (tee is used
> +	# inside the parenthesis).
> +	# shellcheck disable=SC2327,SC2328
>  	lines=$(run_test "$@" > >(tee /dev/fd/$stdout))
>  	ret=$?
>  	exec {stdout}>&-
> diff --git a/scripts/runtime.bash b/scripts/runtime.bash
> index 289e52bb..12ac0f38 100644
> --- a/scripts/runtime.bash
> +++ b/scripts/runtime.bash
> @@ -190,6 +190,12 @@ function run()
>      # qemu_params/extra_params in the config file may contain backticks that
>      # need to be expanded, so use eval to start qemu.  Use "> >(foo)" instead of
>      # a pipe to preserve the exit status.
> +    #
> +    # SC complains that redirection without tee takes output way from command
> +    # substitution, but that is what we want here (tee is used inside the
> +    # parenthesis and output piped to extract_summary which is captured by
> +    # command substitution).
> +    # shellcheck disable=SC2327,SC2328
>      summary=$(eval "$cmdline" 2> >(RUNTIME_log_stderr $testname) \
>                               > >(tee >(RUNTIME_log_stdout $testname $kernel) | extract_summary))
>      ret=$?
> -- 
> 2.51.0

Changed way to away while merging.

Thanks,
drew

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
