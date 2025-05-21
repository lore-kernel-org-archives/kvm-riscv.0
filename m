Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23194C2D0CD
	for <kvm-riscv@archiver.kernel.org>; Wed, 21 May 2025 05:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MSquIuf9FKGkAi+n0+eIaMd7MNYAQW4TDX2pA0RDWD0=; b=z2RE2iHEL9N/ae
	QzDARHTCVNS0uvw9dxIr2U625JxZdBz7Vn+ZIeZ8b2Rl50HnpxVUVphopGolS81+O/nOYnzGKka3K
	IGAA95LESwVzaXmJ4qDUm0lEc+eaE7/1zCxFVa1ylZmRzYjL+3tswf53IDSQ7Q4tKBvR3eY/weYi9
	9mtvOY95K/khTsilGVLC7T67hCFXvx0S08YcSm8Zie1Vrwf7xvMnDV4Iusa/dsnP9rLNJSIq5IbmY
	kqS5fzZRun9JHQ896nIeEkOS4dejYc2V7JbPZ8NhGulJovoSCNWEGJnYORFFqUtWztBTY6fgw/x7Y
	8GybEei4aiaogvcQB/bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHcTi-0000000EtNZ-2qu4;
	Wed, 21 May 2025 05:58:58 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHcTf-0000000EtN8-007U
	for kvm-riscv@lists.infradead.org;
	Wed, 21 May 2025 05:58:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747807133;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3nX0mf0Fkt78o6JfyiUPx6n9zrKuc9Cy4bOKokl+4+0=;
	b=bbVb5lxhfzMtFuEpiak/mAXBs/jqetHwtuBcD+FxFtOzJlwHY93qvz8AwewZUOr8UvOJup
	/XImNIi88Fp5rn+9aO0a4/Lu7LxWy+GtEBGKEt7wwe/CxhIUYgo6W8Gn86xj3foP4/wkF/
	LAbcmAQazeUlTqMwNLtS0mdPr+wEdPw=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-660-qVxfdC_JP4GRwilAmVVEUA-1; Wed, 21 May 2025 01:58:51 -0400
X-MC-Unique: qVxfdC_JP4GRwilAmVVEUA-1
X-Mimecast-MFC-AGG-ID: qVxfdC_JP4GRwilAmVVEUA_1747807131
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-73bfc657aefso4800983b3a.1
        for <kvm-riscv@lists.infradead.org>; Tue, 20 May 2025 22:58:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747807130; x=1748411930;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3nX0mf0Fkt78o6JfyiUPx6n9zrKuc9Cy4bOKokl+4+0=;
        b=uk0RLCdn1FmljR3C7mB6cfewr7yNXkLDB8S1uvLyy/e+JKfvFv1kwRRi39/+Gm7muz
         oAFhnE7wcpCkJkcs5R1O7AuXPC559hV77bxaz6czaIW0oF2BmRRTzGTKXQ6w887IMesn
         RMFkr/5Rt+zA8Mh2P40s4gnmP58L1yG1/7ity5S9JK9gW3lQCTKflQ6KePhaeNh6/E1z
         Y7Br4Zyh84hpvWnN/u5Y/XSfl7+aJU/cQSBLSBsKBW2rroNxmnzZjF3VHZhAV8/iBj/e
         YYUesHaDSv3h9CkgRaVnTkIaPIDYzDz8sZwcyBZ7NQSslCe9lUlNaKrow6sfmfqQ3wmu
         Cn6Q==
X-Forwarded-Encrypted: i=1; AJvYcCXXEPzUm734lfLPPsj4CSbmjFHkhAktEjZi5uOyVS3jaIv7FkBjZPhHEaJXvgYy44BfpRSr3pAOiqU=@lists.infradead.org
X-Gm-Message-State: AOJu0YyHGZ0O7s8vQOoNHmMG2VdAnK5VyntTn9vTUAE1As9nAlA2Wh+y
	zBwtp+0WHrltc0iBW2UK/548Oqek5Jo22xLpGWd6fiAcTPNxr7DovKcymWMp1dVhVvvjaPguZGm
	pzNyJUstvooPQo/wK4y8iWxKMke/i7vAFQQkYD6ieKw5ZMcmL3RHD7i8qSLqHJ2bJjT4=
X-Gm-Gg: ASbGncupd6bFc8eeSqxQc9DyMNpYUrZryRkJP3D20+N51OZhrvBWA4S7KFNj8Qd74py
	h3PJH8nLKIvaGF4pKeKCf9wAyPaUhP/bZ6cvgumZhdu8sTZgFAzrI0yQ7PKzTSP0WFAAFemt4na
	LXMCvbC2y1icOqRPsckEwP5DFK8joEYc7Kkr6zKNxsGmWhFYjVGJAAxsNr998t/+nc0PuDyBJlb
	D1UV1FVkFBgTNIMVMhvVNg1wijRZwhOMR45Y1Y7ggO7K5d+0bgD/54uyBVonh37ManO3qrdOV+m
	xa316+tcmKzbe7Y=
X-Received: by 2002:a05:6a00:99b:b0:73f:f623:55f8 with SMTP id d2e1a72fcca58-742a9776958mr24169509b3a.5.1747807130596;
        Tue, 20 May 2025 22:58:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGz7QgFo322mqLeqRIQ+QKAfXrUPzgO5kq17+j1FtzB/COn8u/dv5TrNOSm4BX2L/XT0g/pCw==
X-Received: by 2002:a05:6a00:99b:b0:73f:f623:55f8 with SMTP id d2e1a72fcca58-742a9776958mr24169482b3a.5.1747807130253;
        Tue, 20 May 2025 22:58:50 -0700 (PDT)
Received: from [10.72.116.61] ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a970c882sm9260119b3a.55.2025.05.20.22.58.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 22:58:49 -0700 (PDT)
Message-ID: <590d9058-7afc-45c7-ac81-68c109dfdad5@redhat.com>
Date: Wed, 21 May 2025 13:58:39 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [kvm-unit-tests PATCH v3 12/16] scripts: Detect kvmtool failure
 in premature_failure()
To: Alexandru Elisei <alexandru.elisei@arm.com>, andrew.jones@linux.dev,
 eric.auger@redhat.com, lvivier@redhat.com, thuth@redhat.com,
 frankja@linux.ibm.com, imbrenda@linux.ibm.com, nrb@linux.ibm.com,
 david@redhat.com, pbonzini@redhat.com
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, will@kernel.org, julien.thierry.kdev@gmail.com,
 maz@kernel.org, oliver.upton@linux.dev, suzuki.poulose@arm.com,
 yuzenghui@huawei.com, joey.gouly@arm.com, andre.przywara@arm.com
References: <20250507151256.167769-1-alexandru.elisei@arm.com>
 <20250507151256.167769-13-alexandru.elisei@arm.com>
From: Shaoqin Huang <shahuang@redhat.com>
In-Reply-To: <20250507151256.167769-13-alexandru.elisei@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 44BGaMGFez06YbP3vxLCbnRuc4Gz801boWgHiwVg0so_1747807131
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_225855_115865_B795F080 
X-CRM114-Status: GOOD (  18.32  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org



On 5/7/25 11:12 PM, Alexandru Elisei wrote:
> kvm-unit-tests assumes that if the VMM is able to get to where it tries to
> load the kernel, then the VMM and the configuration parameters will also
> work for running the test. All of this is done in premature_failure().
> 
> Teach premature_failure() about the kvmtool's error message when it fails
> to load the dummy kernel.
> 
> Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>

Reviewed-by: Shaoqin Huang <shahuang@redhat.com>

> ---
>   scripts/runtime.bash |  8 +++-----
>   scripts/vmm.bash     | 23 +++++++++++++++++++++++
>   2 files changed, 26 insertions(+), 5 deletions(-)
> 
> diff --git a/scripts/runtime.bash b/scripts/runtime.bash
> index 86d8a2cd8528..01ec8eae2bba 100644
> --- a/scripts/runtime.bash
> +++ b/scripts/runtime.bash
> @@ -1,3 +1,5 @@
> +source scripts/vmm.bash
> +
>   : "${RUNTIME_arch_run?}"
>   : "${MAX_SMP:=$(getconf _NPROCESSORS_ONLN)}"
>   : "${TIMEOUT:=90s}"
> @@ -19,11 +21,7 @@ premature_failure()
>   
>       log="$(eval "$(get_cmdline _NO_FILE_4Uhere_)" 2>&1)"
>   
> -    echo "$log" | grep "_NO_FILE_4Uhere_" |
> -        grep -q -e "[Cc]ould not \(load\|open\) kernel" \
> -                -e "error loading" \
> -                -e "failed to load" &&
> -        return 1
> +    ${vmm_opts[$TARGET:parse_premature_failure]} "$log" || return 1
>   
>       RUNTIME_log_stderr <<< "$log"
>   
> diff --git a/scripts/vmm.bash b/scripts/vmm.bash
> index d24a4c4b8713..a1d50ed51981 100644
> --- a/scripts/vmm.bash
> +++ b/scripts/vmm.bash
> @@ -93,6 +93,27 @@ kvmtool_fixup_return_code()
>   	echo $ret
>   }
>   
> +function qemu_parse_premature_failure()
> +{
> +	local log="$@"
> +
> +	echo "$log" | grep "_NO_FILE_4Uhere_" |
> +		grep -q -e "[Cc]ould not \(load\|open\) kernel" \
> +			-e "error loading" \
> +			-e "failed to load" &&
> +		return 1
> +	return 0
> +}
> +
> +function kvmtool_parse_premature_failure()
> +{
> +	local log="$@"
> +
> +	echo "$log" | grep "Fatal: Unable to open kernel _NO_FILE_4Uhere_" &&
> +		return 1
> +	return 0
> +}
> +
>   declare -A vmm_opts=(
>   	[qemu:nr_cpus]='-smp'
>   	[qemu:kernel]='-kernel'
> @@ -100,6 +121,7 @@ declare -A vmm_opts=(
>   	[qemu:initrd]='-initrd'
>   	[qemu:default_opts]=''
>   	[qemu:fixup_return_code]=qemu_fixup_return_code
> +	[qemu:parse_premature_failure]=qemu_parse_premature_failure
>   
>   	[kvmtool:nr_cpus]='--cpus'
>   	[kvmtool:kernel]='--kernel'
> @@ -107,6 +129,7 @@ declare -A vmm_opts=(
>   	[kvmtool:initrd]='--initrd'
>   	[kvmtool:default_opts]="$KVMTOOL_DEFAULT_OPTS"
>   	[kvmtool:fixup_return_code]=kvmtool_fixup_return_code
> +	[kvmtool:parse_premature_failure]=kvmtool_parse_premature_failure
>   )
>   
>   function check_vmm_supported()

-- 
Shaoqin


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
