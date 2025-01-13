Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4812FC02180
	for <kvm-riscv@archiver.kernel.org>; Mon, 13 Jan 2025 15:48:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GU6ls0tZxh4ZOqbUkJzjpcxmSk8HdczFJEBAzRz7OTM=; b=Zgi+er1X5LkCY5
	2SbwRgPtqu7UV7ABZr+CHeIW9C9pViWJNZQ1FT2iTw1ZXKUzG6HpdKp6KW8UJgVE6kq0jI4Zc/ulz
	/C5mTJHeAM4PiAj5Q40Toc5sP/8Uw58G25ybcGsABENgd7Fn3z8ZN5wmf29w8LbqwHsNehYpTonmZ
	o5DQ5PfmG71XQQ0PQU9ub9j4aBjpkwDdHWgxJLWuFa7Q13cN966TRkJqzq0D3vGqvbHzuauQMHYhE
	Nkechp4ODzBHZQ0fTqY0yIfIK4oRdMG5Yw4LTAOu9I9bpyNXf9NvnXp9H4Gf7J2aLTXouu7pV0eiG
	JCpcEXOWW9/6i2mRRhUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXMfv-00000005iKq-3tCW;
	Mon, 13 Jan 2025 15:48:23 +0000
Received: from out-178.mta0.migadu.com ([91.218.175.178])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXLxC-00000005X8K-0aFt
	for kvm-riscv@lists.infradead.org;
	Mon, 13 Jan 2025 15:02:12 +0000
Date: Mon, 13 Jan 2025 16:01:58 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1736780522;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KwFSzUI7AdO7FN349dbUBnEYz5JimFOvpyWuoBOACSs=;
	b=VgUr5y4bQO1Br7MsgRdM1yCg/KVoRF6a29p+gYXkeY6gfIyCy+x35yMDZCFlI5dFxc3uid
	JtEpJHj3e3C8PLPpr9BNvSyShTJt3K0xoqNMpByq1XfH+tJUKm4mzI5Q+UAPA//+02zQa1
	COW1rZcCyiE9+UKnRWMTecZzncHIwj8=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: Alexandru Elisei <alexandru.elisei@arm.com>
Cc: eric.auger@redhat.com, lvivier@redhat.com, thuth@redhat.com, 
	frankja@linux.ibm.com, imbrenda@linux.ibm.com, nrb@linux.ibm.com, david@redhat.com, 
	pbonzini@redhat.com, kvmarm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	kvm-riscv@lists.infradead.org, linux-s390@vger.kernel.org, vladimir.murzin@arm.com
Subject: Re: [kvm-unit-tests PATCH v1 1/5] configure: Document that the
 architecture name 'aarch64' is also supported
Message-ID: <20250113-0fe04c6089726d1d06a254ec@orel>
References: <20250110135848.35465-1-alexandru.elisei@arm.com>
 <20250110135848.35465-2-alexandru.elisei@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250110135848.35465-2-alexandru.elisei@arm.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_070210_452951_2F7E3CEE 
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

On Fri, Jan 10, 2025 at 01:58:44PM +0000, Alexandru Elisei wrote:
> $arch, on arm64, defaults to 'aarch64', and later in the script is replaced
> by 'arm64'. Intentional or not, document that the name 'aarch64' is also
> supported when configuring for the arm64 architecture. This has been the
> case since the initial commit that added support for the arm64
> architecture, commit 39ac3f8494be ("arm64: initial drop").
> 
> The help text for --arch changes from*:
> 
>    --arch=ARCH            architecture to compile for (aarch64). ARCH can be one of:
>                            arm, arm64, i386, ppc64, riscv32, riscv64, s390x, x86_64
> 
> to:
> 
>     --arch=ARCH            architecture to compile for (aarch64). ARCH can be one of:
>                            arm, arm64/aarch64, i386, ppc64, riscv32, riscv64, s390x, x86_64
> 
> *Worth pointing out that the default architecture is 'aarch64', even though
> the rest of the help text doesn't have it as one of the supported
> architectures.
> 
> Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
> ---
>  configure | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/configure b/configure
> index 86cf1da36467..5b0a2d7f39c0 100755
> --- a/configure
> +++ b/configure
> @@ -47,7 +47,7 @@ usage() {
>  
>  	Options include:
>  	    --arch=ARCH            architecture to compile for ($arch). ARCH can be one of:
> -	                           arm, arm64, i386, ppc64, riscv32, riscv64, s390x, x86_64
> +	                           arm, arm64/aarch64, i386, ppc64, riscv32, riscv64, s390x, x86_64
>  	    --processor=PROCESSOR  processor to compile for ($arch)
>  	    --target=TARGET        target platform that the tests will be running on (qemu or
>  	                           kvmtool, default is qemu) (arm/arm64 only)
> -- 
> 2.47.1
>

I'd prefer to support --arch=aarch64, but then always refer to it as only
arm64 everywhere else. We need to support arch=aarch64 since that's what
'uname -m' returns, but I don't think we need to change the help text for
it. If we don't want to trust our users to figure out arm64==aarch64,
then we can do something like

@@ -216,12 +197,12 @@ while [[ $optno -le $argc ]]; do
            werror=
            ;;
        --help)
-           usage
+           do_help=1
            ;;
        *)
            echo "Unknown option '$opt'"
            echo
-           usage
+           do_help=1
            ;;
     esac
 done

And then only do

 if [ $do_help ]; then
    usage
 fi

after $arch and other variables have had a chance to be converted.

Thanks,
drew

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
