Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A78E8C83F1B
	for <kvm-riscv@archiver.kernel.org>; Fri, 11 Jul 2025 14:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8sgQZYNyIQo5cDd1aT231aXA3iPMb4V8JeP9zPFgXNc=; b=DCLzSQxG8KySYm
	YtVzyVf1SMdji16oxInO7k6Ahe5tRsz9bBbQKIX1Yl9FRZvRHRIk7WtrHAx1xTOZS++lM5Dt607H/
	bUNCRE+2x9My6ScFMiEdnRqKvFrevTKqrPEOCWbTUHWangbS8qY3UF9ZZkDZiEzrHA1P4ReHsC26w
	tXS3F+9/SX+O8i3tyjIbVgdP5z6foQ9Qg7FaM2DLpQLLTTuAiBlAvzqg6dXiU06orUo/TMNvOv9G5
	eJUoEiQjZ2F2mtnf6qq/lycE9BY56SiNwIIVNdiG4UTTYRom1sjVORumsKt3kDYYvNWPk2tpO86YW
	+JNCkyZjsm6fpVH75qwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaEss-0000000F2aY-1rOc;
	Fri, 11 Jul 2025 14:37:54 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaEso-0000000F2YY-2LCN
	for kvm-riscv@lists.infradead.org;
	Fri, 11 Jul 2025 14:37:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752244669;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=/BU9s+p9vDeup7+iZfjpoY4Y+pfEtPqATP7w87mkUv0=;
	b=HstFGfTS5qlJ31tCReVhKTHkTsy4rWNJbrQlBux1U0+ZNlYa/EJ8IxicfvgVo6sFfWhwGr
	eXR/fOc8T8Y1gZutQqd4AbnyL4nF33YYXDOI+LeLEpJXKo1BQhm7msqt3Q8kaSvKse1Q/G
	ryL5aUJoKjY1Uj5nbXxUoQi/T0GK75k=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-586-MvyzYcaKObyZUFIwtUUeTg-1; Fri, 11 Jul 2025 10:37:48 -0400
X-MC-Unique: MvyzYcaKObyZUFIwtUUeTg-1
X-Mimecast-MFC-AGG-ID: MvyzYcaKObyZUFIwtUUeTg_1752244667
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3a5281ba3a4so821055f8f.0
        for <kvm-riscv@lists.infradead.org>; Fri, 11 Jul 2025 07:37:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752244667; x=1752849467;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/BU9s+p9vDeup7+iZfjpoY4Y+pfEtPqATP7w87mkUv0=;
        b=VkvBig+DeoNBBtqXZFlp32lp8+9+mob72NRhehDmlufP2Q93JOs4Rhns8jBjvk9TLq
         +hi56iP/WkyL3OFpPh9E2aRqcCWBbh4vkzVCxr6TdcOr3N36/V9zU7fn3N91FaRIhnyZ
         sNNeXiHoWjJLb14cgADTVX3Td4OSJedsPOZjdBrUfY3rr2fYQV16THzkHU865cqUhtaB
         5yExwBJDct+jjL8uzwsMnOsJINl5wiQGwF2taST2gL+//dZw4Q8zyw7/OeBheQDbzxfN
         ogLez1RiJAMfLOK+HOvGxRt23Oxr05AulKICgo31NjJ6GdyCj5bhLi38/rHjWNxZ0NMj
         PJSg==
X-Forwarded-Encrypted: i=1; AJvYcCXHYkANhMv8DYrm/VzvLS/7a8jCoKctDzRVVKNxBxQqk9VxhkixYZZvb/InhWe4YHO/TNDap+koOq4=@lists.infradead.org
X-Gm-Message-State: AOJu0YxF52Rd/NqnGGWA16PZOWvrTYwQmDTxeiUW3a5rbizAhYSc9L/U
	eIuk3tX90G9pjCCJhu6p9lkidedqj+mlO1pU3GTCPJNnNg6k+l0QpOOTvl48xPHP6Srh0h4h1nS
	T7LxfFRMbCJf7mFItDxggo4NzGvzBbXutU3PisOPxIKT/x6Cwh5uaOuPk+zTAWfUoexc=
X-Gm-Gg: ASbGncumHYdnWblvw4v3hWtkEcbd92E+C1Kv/Qk+4d9hVGjyra82MiXPCpZ7sGHTGGC
	+66o7cUVLHiBvO9i5grdwoTj4fBgVLD5fXlkapUofj4eszRRF0MVW2f2s6bWW6NqZ1uTBczhpkw
	9fdlHr/K1h5FwSRqxjAObs/2SyzbyCdyeIM3ilhU2cC8oLO1JerGm2lpih1yE6v3wpwFJjSlYg/
	NJiKfSoStY5PK7KiOV325fcnSNQAqMl6rCoHNnpI0SXFV3jxF8O9emgxSacgbMq0G0Zoq0FCz3s
	xlxsx+WBfVVsLsMutJ4XO8pgQ19ZCzSI7hIZGqmIwdv4mfFKghqJLTq/HCZk78mtW8/cW1+DaPU
	U6XeN
X-Received: by 2002:a05:6000:20ca:b0:3a6:d349:1b52 with SMTP id ffacd0b85a97d-3b5f1887badmr2596038f8f.21.1752244666605;
        Fri, 11 Jul 2025 07:37:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFXCQnwKJ4P2xru4rDXDie6A6u61embhawOE9E4KtDmPAJ5DNlW7yRl8zSbtPMgPw96iVGU/Q==
X-Received: by 2002:a05:6000:20ca:b0:3a6:d349:1b52 with SMTP id ffacd0b85a97d-3b5f1887badmr2596020f8f.21.1752244666189;
        Fri, 11 Jul 2025 07:37:46 -0700 (PDT)
Received: from [192.168.0.6] (ltea-047-064-115-149.pools.arcor-ip.net. [47.64.115.149])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454cdc4671bsm74502545e9.3.2025.07.11.07.37.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Jul 2025 07:37:45 -0700 (PDT)
Message-ID: <c1b1ca55-13e3-44ff-9889-f31f27501372@redhat.com>
Date: Fri, 11 Jul 2025 16:37:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [kvm-unit-tests PATCH v4 07/13] scripts: Add default arguments
 for kvmtool
To: Andrew Jones <andrew.jones@linux.dev>
Cc: Alexandru Elisei <alexandru.elisei@arm.com>, eric.auger@redhat.com,
 lvivier@redhat.com, frankja@linux.ibm.com, imbrenda@linux.ibm.com,
 nrb@linux.ibm.com, david@redhat.com, pbonzini@redhat.com,
 kvm@vger.kernel.org, kvmarm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
 kvm-riscv@lists.infradead.org, linux-s390@vger.kernel.org, will@kernel.org,
 julien.thierry.kdev@gmail.com, maz@kernel.org, oliver.upton@linux.dev,
 suzuki.poulose@arm.com, yuzenghui@huawei.com, joey.gouly@arm.com,
 andre.przywara@arm.com, shahuang@redhat.com, Boqiao Fu <bfu@redhat.com>
References: <20250625154813.27254-1-alexandru.elisei@arm.com>
 <20250625154813.27254-8-alexandru.elisei@arm.com>
 <ce92db8c-6d26-4953-9f74-142d00d2bc2a@redhat.com>
 <20250711-357d520bb64154cbe119679b@orel>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 xsFNBFH7eUwBEACzyOXKU+5Pcs6wNpKzrlJwzRl3VGZt95VCdb+FgoU9g11m7FWcOafrVRwU
 yYkTm9+7zBUc0sW5AuPGR/dp3pSLX/yFWsA/UB4nJsHqgDvDU7BImSeiTrnpMOTXb7Arw2a2
 4CflIyFqjCpfDM4MuTmzTjXq4Uov1giGE9X6viNo1pxyEpd7PanlKNnf4PqEQp06X4IgUacW
 tSGj6Gcns1bCuHV8OPWLkf4hkRnu8hdL6i60Yxz4E6TqlrpxsfYwLXgEeswPHOA6Mn4Cso9O
 0lewVYfFfsmokfAVMKWzOl1Sr0KGI5T9CpmRfAiSHpthhHWnECcJFwl72NTi6kUcUzG4se81
 O6n9d/kTj7pzTmBdfwuOZ0YUSqcqs0W+l1NcASSYZQaDoD3/SLk+nqVeCBB4OnYOGhgmIHNW
 0CwMRO/GK+20alxzk//V9GmIM2ACElbfF8+Uug3pqiHkVnKqM7W9/S1NH2qmxB6zMiJUHlTH
 gnVeZX0dgH27mzstcF786uPcdEqS0KJuxh2kk5IvUSL3Qn3ZgmgdxBMyCPciD/1cb7/Ahazr
 3ThHQXSHXkH/aDXdfLsKVuwDzHLVSkdSnZdt5HHh75/NFHxwaTlydgfHmFFwodK8y/TjyiGZ
 zg2Kje38xnz8zKn9iesFBCcONXS7txENTzX0z80WKBhK+XSFJwARAQABzR5UaG9tYXMgSHV0
 aCA8dGh1dGhAcmVkaGF0LmNvbT7CwXgEEwECACIFAlVgX6oCGwMGCwkIBwMCBhUIAgkKCwQW
 AgMBAh4BAheAAAoJEC7Z13T+cC21EbIP/ii9cvT2HHGbFRl8HqGT6+7Wkb+XLMqJBMAIGiQK
 QIP3xk1HPTsLfVG0ao4hy/oYkGNOP8+ubLnZen6Yq3zAFiMhQ44lvgigDYJo3Ve59gfe99KX
 EbtB+X95ODARkq0McR6OAsPNJ7gpEUzfkQUUJTXRDQXfG/FX303Gvk+YU0spm2tsIKPl6AmV
 1CegDljzjycyfJbk418MQmMu2T82kjrkEofUO2a24ed3VGC0/Uz//XCR2ZTo+vBoBUQl41BD
 eFFtoCSrzo3yPFS+w5fkH9NT8ChdpSlbNS32NhYQhJtr9zjWyFRf0Zk+T/1P7ECn6gTEkp5k
 ofFIA4MFBc/fXbaDRtBmPB0N9pqTFApIUI4vuFPPO0JDrII9dLwZ6lO9EKiwuVlvr1wwzsgq
 zJTPBU3qHaUO4d/8G+gD7AL/6T4zi8Jo/GmjBsnYaTzbm94lf0CjXjsOX3seMhaE6WAZOQQG
 tZHAO1kAPWpaxne+wtgMKthyPLNwelLf+xzGvrIKvLX6QuLoWMnWldu22z2ICVnLQChlR9d6
 WW8QFEpo/FK7omuS8KvvopFcOOdlbFMM8Y/8vBgVMSsK6fsYUhruny/PahprPbYGiNIhKqz7
 UvgyZVl4pBFjTaz/SbimTk210vIlkDyy1WuS8Zsn0htv4+jQPgo9rqFE4mipJjy/iboDzsFN
 BFH7eUwBEAC2nzfUeeI8dv0C4qrfCPze6NkryUflEut9WwHhfXCLjtvCjnoGqFelH/PE9NF4
 4VPSCdvD1SSmFVzu6T9qWdcwMSaC+e7G/z0/AhBfqTeosAF5XvKQlAb9ZPkdDr7YN0a1XDfa
 +NgA+JZB4ROyBZFFAwNHT+HCnyzy0v9Sh3BgJJwfpXHH2l3LfncvV8rgFv0bvdr70U+On2XH
 5bApOyW1WpIG5KPJlDdzcQTyptOJ1dnEHfwnABEfzI3dNf63rlxsGouX/NFRRRNqkdClQR3K
 gCwciaXfZ7ir7fF0u1N2UuLsWA8Ei1JrNypk+MRxhbvdQC4tyZCZ8mVDk+QOK6pyK2f4rMf/
 WmqxNTtAVmNuZIwnJdjRMMSs4W4w6N/bRvpqtykSqx7VXcgqtv6eqoDZrNuhGbekQA0sAnCJ
 VPArerAZGArm63o39me/bRUQeQVSxEBmg66yshF9HkcUPGVeC4B0TPwz+HFcVhheo6hoJjLq
 knFOPLRj+0h+ZL+D0GenyqD3CyuyeTT5dGcNU9qT74bdSr20k/CklvI7S9yoQje8BeQAHtdV
 cvO8XCLrpGuw9SgOS7OP5oI26a0548M4KldAY+kqX6XVphEw3/6U1KTf7WxW5zYLTtadjISB
 X9xsRWSU+Yqs3C7oN5TIPSoj9tXMoxZkCIHWvnqGwZ7JhwARAQABwsFfBBgBAgAJBQJR+3lM
 AhsMAAoJEC7Z13T+cC21hPAQAIsBL9MdGpdEpvXs9CYrBkd6tS9mbaSWj6XBDfA1AEdQkBOn
 ZH1Qt7HJesk+qNSnLv6+jP4VwqK5AFMrKJ6IjE7jqgzGxtcZnvSjeDGPF1h2CKZQPpTw890k
 fy18AvgFHkVk2Oylyexw3aOBsXg6ukN44vIFqPoc+YSU0+0QIdYJp/XFsgWxnFIMYwDpxSHS
 5fdDxUjsk3UBHZx+IhFjs2siVZi5wnHIqM7eK9abr2cK2weInTBwXwqVWjsXZ4tq5+jQrwDK
 cvxIcwXdUTLGxc4/Z/VRH1PZSvfQxdxMGmNTGaXVNfdFZjm4fz0mz+OUi6AHC4CZpwnsliGV
 ODqwX8Y1zic9viSTbKS01ZNp175POyWViUk9qisPZB7ypfSIVSEULrL347qY/hm9ahhqmn17
 Ng255syASv3ehvX7iwWDfzXbA0/TVaqwa1YIkec+/8miicV0zMP9siRcYQkyTqSzaTFBBmqD
 oiT+z+/E59qj/EKfyce3sbC9XLjXv3mHMrq1tKX4G7IJGnS989E/fg6crv6NHae9Ckm7+lSs
 IQu4bBP2GxiRQ+NV3iV/KU3ebMRzqIC//DCOxzQNFNJAKldPe/bKZMCxEqtVoRkuJtNdp/5a
 yXFZ6TfE1hGKrDBYAm4vrnZ4CXFSBDllL59cFFOJCkn4Xboj/aVxxJxF30bn
In-Reply-To: <20250711-357d520bb64154cbe119679b@orel>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: bmJ4fBP1peDkZ9M4Jkn4MreGpjdUJQpRoV9Pp4Rd4wI_1752244667
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_073750_671673_3ACC571F 
X-CRM114-Status: UNSURE (   8.92  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

On 11/07/2025 16.35, Andrew Jones wrote:
> On Fri, Jul 11, 2025 at 01:32:33PM +0200, Thomas Huth wrote:
> ...
>>> +function vmm_default_opts()
>>> +{
>>> +	echo ${vmm_optname[$(vmm_get_target),default_opts]}
>>> +}
>>
>>
>> This causes now a problem on s390x:
>>
>> https://gitlab.com/kvm-unit-tests/kvm-unit-tests/-/jobs/10604334029#L591
>>
>> scripts/common.bash: line 56: vmm_defaults_opts: command not found
>>
>> ... any ideas how to fix it?
> 
> This is fixed by https://lore.kernel.org/all/20250709085938.33254-2-andrew.jones@linux.dev/
> which I just pushed.

Ah, right, thanks! And sorry for missing the patch!

  Thomas


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
