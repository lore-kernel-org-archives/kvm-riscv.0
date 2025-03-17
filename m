Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4997C282EC
	for <kvm-riscv@archiver.kernel.org>; Mon, 17 Mar 2025 08:27:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:
	From:Subject:MIME-Version:Date:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m4Sq2bVmKjUbwjk6Fl30iZG/ZKca7d6LvJO15bXSdfU=; b=s+n9Su+75V8auR
	eN8ToA8tygkbZqrgA3BNtKeJfMpLCpilF1iYmytE5ITszME5KMN0o+2G5nj0vhiJIoZqGo7+pySyA
	vhH2Ig3q2q9ZMTr9h//SiUkWW6NrzB5SnNNShh9GLaNKANIsn/zWB5K0C0HyAVSAalnQTnZVlonXH
	1NYGAgCzQvv1lv4yuxJ6811iT9xJj81ee80vAsw46jpV6b2LWXBGgzaWSC/tLVdUdcVPK4uc2Ll/b
	JrNpcWWnQZ2/dpbF885zu5sNzajJOUtlTzdeHqAOUNwJDygRZHi68gEhAiAkO/7aW87d3oBX6tnxg
	X25FFoTVIXflNeiMPMnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tu5p2-00000001jub-21dt;
	Mon, 17 Mar 2025 08:27:44 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tu5p0-00000001jtO-0NUM
	for kvm-riscv@lists.infradead.org;
	Mon, 17 Mar 2025 08:27:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742200061;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qaEC6lM4c8aLRLEjNI+sQ2in0w+9/2SdD4KxuUiKf1U=;
	b=bjaIlm6dPzvkZhxYOvFi1kFXV5s0xqcKUwcey14EkrRl0YQyeZlNQOhGPIKXcC845FWhlf
	R7H82p187wdXowEYd3gwt0JPrD1+FDvRkuqLz3mU7F5zmaUKGrCSSpf98po4NiSCOlYG0n
	KGdb3yfrZxTfE4XG32FeN/0KRqCkX8k=
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-67-4fGNkintPWqHHfq-fwnIdQ-1; Mon, 17 Mar 2025 04:27:37 -0400
X-MC-Unique: 4fGNkintPWqHHfq-fwnIdQ-1
X-Mimecast-MFC-AGG-ID: 4fGNkintPWqHHfq-fwnIdQ_1742200056
Received: by mail-io1-f71.google.com with SMTP id ca18e2360f4ac-85b34bd03c4so612427539f.3
        for <kvm-riscv@lists.infradead.org>; Mon, 17 Mar 2025 01:27:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742200056; x=1742804856;
        h=content-transfer-encoding:in-reply-to:references:reply-to:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qaEC6lM4c8aLRLEjNI+sQ2in0w+9/2SdD4KxuUiKf1U=;
        b=uZv7/VKoLlapt10ub74nFA8ia17KAlqOf/jt11qleytxHKxGPItFMq4DQvKlm8wKxK
         iDJwh08GeKpuYZGYGBkhwsaGwKtYU3liKWnO0U371PVNyl/vKLU5yK0fQa3O0Olk4183
         J7j9yt1qha4bMxULdtbP5XO5Pzr99LiPrhbsqSN4lvD2qlQET0a7QctpRj1ZGQpiHYKw
         o/wEqNpp4IVgRNoICJH5IPlfIdWbKI7ZvqYkpdYCklgenmDcha1tFkiqW6n25X+DfPzn
         Gyvk8uu1cCfqUhzrZ8T2i7TTQVeuTFYzIbPHLtYyplfbfkPlrGgQKXflcPDIGEuauPIp
         JT0w==
X-Forwarded-Encrypted: i=1; AJvYcCUFJ7XtIqK1wFlkxzXBpD0P3uP6QT0Zgl98VtlfigmQD1dckYsAWmm1FVv95Vnslik3f4WBYAq+FuE=@lists.infradead.org
X-Gm-Message-State: AOJu0YzIS6FUAqgHHdTTwtRhRecpcva1msCTvWNl6jNVgrR/LG9LK4fA
	4ygdAZcwWposH8029SIf54G3lImiHf83eKQOqjOhOXhpMUP2VbrrD5+DQAhv66gf3uCTAo4PAUH
	Dt02sSkCUjwNWjomQzJJKAVKmtuAwJYg9ZYHJqSLFqS9Ppe9yoOVwnTABrbHzJVI=
X-Gm-Gg: ASbGncv6KvcqQ/PMf7upff2oICt0HIPFd8oQdmsneqrGabl0uJMN/zlEFcEAvigdHFg
	IlQSOQs0/HiFaq7UuOATv8MEFdcI+e0OS56oFbgEtwg5B4uH+XgeSZDCkALlDDWrBXaPwscDIup
	G2tvN0iHfvYkIzT0YtERnxIcXLzOnZ4r8NhEzs8UWIXM0Sk0iNYXDAV0ObEAd78R5EgRYMiJ9jO
	Z3V+EzOQdzjKCpVtBi8fNxHKbEEA8ASqNuGBwwzLDXegfQE1ZjAfyL/F2v5SyplDiFFIj1v1L7M
	oGhZQAwSKP0y8EGQzXQCiTcCAA/ia3tDxM8/sZt4zl3/2MhdmvYs0Y0Fg19+4Tw=
X-Received: by 2002:a05:6e02:b46:b0:3d4:2a4e:1272 with SMTP id e9e14a558f8ab-3d483a7517fmr123863695ab.19.1742200056615;
        Mon, 17 Mar 2025 01:27:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGd41vdtyIf466bhMfI+neQE4uPHYcdKmdVV38Hf3JbIctOMMqGI2AFDJ73sUyG0hh2b4szAQ==
X-Received: by 2002:a05:6e02:b46:b0:3d4:2a4e:1272 with SMTP id e9e14a558f8ab-3d483a7517fmr123863585ab.19.1742200056319;
        Mon, 17 Mar 2025 01:27:36 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874? ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f2637031a4sm2196881173.11.2025.03.17.01.27.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Mar 2025 01:27:35 -0700 (PDT)
Message-ID: <fcb7894d-51e5-4376-b32f-4cb9eb94b573@redhat.com>
Date: Mon, 17 Mar 2025 09:27:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [kvm-unit-tests PATCH v2 1/5] configure: arm64: Don't display
 'aarch64' as the default architecture
From: Eric Auger <eric.auger@redhat.com>
To: Jean-Philippe Brucker <jean-philippe@linaro.org>, andrew.jones@linux.dev,
 alexandru.elisei@arm.com
Cc: kvmarm@lists.linux.dev, kvm@vger.kernel.org,
 kvm-riscv@lists.infradead.org, vladimir.murzin@arm.com
References: <20250314154904.3946484-2-jean-philippe@linaro.org>
 <20250314154904.3946484-3-jean-philippe@linaro.org>
 <1b0233dc-b303-4317-a65d-572cc3582b8a@redhat.com>
In-Reply-To: <1b0233dc-b303-4317-a65d-572cc3582b8a@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: XXg03vjoPN-eGQhH6MHQ36l2vYXRSP86n_vpuRlTqwU_1742200056
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_012742_221640_4EA2430C 
X-CRM114-Status: GOOD (  17.33  )
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
Reply-To: eric.auger@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org



On 3/17/25 9:19 AM, Eric Auger wrote:
> Hi Jean-Philippe,
> 
> 
> On 3/14/25 4:49 PM, Jean-Philippe Brucker wrote:
>> From: Alexandru Elisei <alexandru.elisei@arm.com>
>>
>> --arch=aarch64, intentional or not, has been supported since the initial
>> arm64 support, commit 39ac3f8494be ("arm64: initial drop"). However,
>> "aarch64" does not show up in the list of supported architectures, but
>> it's displayed as the default architecture if doing ./configure --help
>> on an arm64 machine.
>>
>> Keep everything consistent and make sure that the default value for
>> $arch is "arm64", but still allow --arch=aarch64, in case they are users
> there
>> that use this configuration for kvm-unit-tests.
>>
>> The help text for --arch changes from:
>>
>>    --arch=ARCH            architecture to compile for (aarch64). ARCH can be one of:
>>                            arm, arm64, i386, ppc64, riscv32, riscv64, s390x, x86_64
>>
>> to:
>>
>>     --arch=ARCH            architecture to compile for (arm64). ARCH can be one of:
>>                            arm, arm64, i386, ppc64, riscv32, riscv64, s390x, x86_64
>>
>> Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
>> ---
>>  configure | 5 +++--
>>  1 file changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/configure b/configure
>> index 06532a89..dc3413fc 100755
>> --- a/configure
>> +++ b/configure
>> @@ -15,8 +15,9 @@ objdump=objdump
>>  readelf=readelf
>>  ar=ar
>>  addr2line=addr2line
>> -arch=$(uname -m | sed -e 's/i.86/i386/;s/arm64/aarch64/;s/arm.*/arm/;s/ppc64.*/ppc64/')
>> -host=$arch
>> +host=$(uname -m | sed -e 's/i.86/i386/;s/arm64/aarch64/;s/arm.*/arm/;s/ppc64.*/ppc64/')
>> +arch=$host
>> +[ "$arch" = "aarch64" ] && arch="arm64"
> Looks the same it done again below

Ignore this. This is done again after explicit arch setting :-/ Need
another coffee

So looks good to me
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric

> 
> arch_name=$arch
> [ "$arch" = "aarch64" ] && arch="arm64"
> [ "$arch_name" = "arm64" ] && arch_name="aarch64" <---
> arch_libdir=$arch
> 
> maybe we could move all arch settings at the same location so that it
> becomes clearer?
> 
> Thanks
> 
> Eric
> 
>>  cross_prefix=
>>  endian=""
>>  pretty_print_stacks=yes
> 


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
