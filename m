Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32642C83F09
	for <kvm-riscv@archiver.kernel.org>; Tue,  8 Jul 2025 03:41:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:From:Mime-Version:Message-Id:
	Date:Cc:In-Reply-To:To:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w+gMDk7gUy0FjcqpeTud9kWNjRKumAfO3mqqvAUOIyU=; b=ZMQnKCA9htXTNF
	5Pl+G8LrTSbvufhivWhJjRA9dS1iWFkk8Oz9UDilDWLr0+DjuvEievY07lWDI/z8PkVfcciY4KTs8
	cS+bSXOuo/1/sL6b8w50vYuk4Bi461mp51u1BhGGzW8IPqRyTAm7NgkcRb9ntM0mINJeePv3NnXt0
	dw0W2M5t9Njr6xkL9xQkSaZRJQgRw5Jbp5sla7PzQr2gTGhJ8BGH0ax5yPekI5A2WddvmNF50Wzcf
	jXGawQJqcZh9Zg2AV/nBJ8YPWuwHVqi+bh0795ygI5IfzgCUwFjxBXkBL/wSETSkuTzU793WLqmlj
	PTPgw5iMxZOwhUCFHINw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYzD2-00000004C7d-33xJ;
	Tue, 08 Jul 2025 03:41:32 +0000
Received: from sg-1-17.ptr.blmpb.com ([118.26.132.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYzCz-00000004C7F-1F5I
	for kvm-riscv@lists.infradead.org;
	Tue, 08 Jul 2025 03:41:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=lanxincomputing-com.20200927.dkim.feishu.cn; t=1751946083;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=JIChZwtf7KFp0wUJEQAWGYcy6kZOQ3nX77/WhXlHmLk=;
 b=qS/gOdDtwms6MeuigxcdrMAhexKDt63xsVN66NCZu4lBk/5Hmx2IT77ogeTHKmNa0oSnwV
 7AnzSYt61yRvXTMvSxz75bA05URXRqWgRMhh/qA5GMlhJ+23+xfC4vs5q9NsZhFx+U78XH
 ueUhxOC8RwojtzqXKAKqcZsoUvXXPhtIFwaZnEbVjyMifyWZqIGsLBzg0VCTKoWfWUkid3
 pKj/qfYoRN+FwuS9mLY7+75PsePxfKF8x6K5Te7eYLI70jgfYlctAMpLDkSOXi2KYqgmPi
 3Dfhs4hTl1jLYNRsf1Y7mVtqjwHlHSNIXpqhNrGeSTzAsz8fDey3l2B09dsEew==
References: <20250704151254.100351-4-andrew.jones@linux.dev> <20250704151254.100351-5-andrew.jones@linux.dev>
To: "Andrew Jones" <andrew.jones@linux.dev>, <kvm@vger.kernel.org>, 
	<kvmarm@lists.linux.dev>, <kvm-riscv@lists.infradead.org>
Content-Language: en-US
X-Lms-Return-Path: <lba+2686c9361+2a7208+lists.infradead.org+liujingqi@lanxincomputing.com>
In-Reply-To: <20250704151254.100351-5-andrew.jones@linux.dev>
Cc: <alexandru.elisei@arm.com>, <cleger@rivosinc.com>, <jesse@rivosinc.com>, 
	<jamestiotio@gmail.com>, "Atish Patra" <atishp@rivosinc.com>
Date: Tue, 8 Jul 2025 11:41:18 +0800
Message-Id: <2ccbb58b-1993-450e-b9c5-4b7fcb9c80a2@lanxincomputing.com>
Mime-Version: 1.0
User-Agent: Mozilla Thunderbird
Received: from [127.0.0.1] ([116.237.111.137]) by smtp.feishu.cn with ESMTPS; Tue, 08 Jul 2025 11:41:20 +0800
X-Original-From: Nutty Liu <liujingqi@lanxincomputing.com>
From: "Nutty Liu" <liujingqi@lanxincomputing.com>
Subject: Re: [kvm-unit-tests PATCH 1/2] arm/arm64: Ensure proper host arch with kvmtool
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_204129_519389_8F6AD00E 
X-CRM114-Status: GOOD (  10.45  )
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

On 7/4/2025 11:12 PM, Andrew Jones wrote:
> When running on non-arm (e.g. an x86 machine) if the framework is
> configured to use kvmtool then, unlike with QEMU, it can't work.
>
> Signed-off-by: Andrew Jones <andrew.jones@linux.dev>
Reviewed-by: Nutty Liu <liujingqi@lanxincomputing.com>

Thanks,
Nutty
> ---
>   arm/run | 5 +++++
>   1 file changed, 5 insertions(+)
>
> diff --git a/arm/run b/arm/run
> index 9ee795ae424c..858333fce465 100755
> --- a/arm/run
> +++ b/arm/run
> @@ -97,6 +97,11 @@ function arch_run_kvmtool()
>   {
>   	local command
>   
> +	if [ "$HOST" != "arm" ] && [ "$HOST" != "aarch64" ]; then
> +		echo "kvmtool requires KVM but the host ('$HOST') is not arm" >&2
> +		exit 2
> +	fi
> +
>   	kvmtool=$(search_kvmtool_binary) ||
>   		exit $?

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
