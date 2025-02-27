Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F0A7C021B8
	for <kvm-riscv@archiver.kernel.org>; Thu, 27 Feb 2025 00:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IsAbwyDsqYDHlzsfIP9stgQb1IhfnOqabDkn4z/K8qs=; b=3HonHR3VZwvj27
	8EIBUrNMisQvAYlignsxRbaXqaOk32R0ZD5Y1qWiMMcfVaYHDe45PdsIP2zd0xZsVwTUO6z7vnCli
	Zu1/IohPCPWQuQ04TMgmEMnmHbq9Peb46t/xhb5MqZ3rlMiaYww6kzfZ0IiDsjwRY5Io3/wchegV1
	O3c0FHAIv3L4lB4XnwIkVAz27Rm2wqmYjUnVYUJAh2dpLZWxmGkyzRCrVwQjc2uje7WGMHL0qsMc/
	GSqdCuD78J+QsX8o1nmYE87W3nEoqE3xeCthAnhFEUuvU0pXfI9KFc7LwxyQxkUlWAHgrrntCX50M
	EUJTujHeI61Db9upeCaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnRTF-00000005mPM-0pud;
	Thu, 27 Feb 2025 00:09:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnRQp-00000005luB-1gZ1
	for kvm-riscv@bombadil.infradead.org;
	Thu, 27 Feb 2025 00:07:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=7nOMcPPI5c1jXJRM+8g52gTtzt6JEQOhHcXYY3HpyA0=; b=NDaOlteAvv4dnELFbw6qHo33b7
	mlNqJBpjQL+D/hK4MewA39+MeUA9CDait/UB1r8hP/4tlBkN4JMRuCqfjzDXGkiDTgOJ+bRl6VPa7
	ZbClyvCq8xrv09CMgSZU30OSwGBBhoj497Hp0EKB8Rb4IcS0DwhjnxNfXgaApw34OOfYB32LeLLRb
	3syK87XEjKkrSviHRd0J9ddNHKSUoYM+GHAkfXcTrV/BNpGvxikj2UIMKYQdGW5Ppd/c1NryTZvM2
	m+KGSh1fDhFxCDtE9/fv37bjGvk9Tc0YvsOluQh96iQUun2V8suOGcY5J+nE4Ai5rNEN4JFdu/+Qk
	w1CGQE0g==;
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnRQk-00000003hvo-0ZoS
	for kvm-riscv@lists.infradead.org;
	Thu, 27 Feb 2025 00:07:13 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-2f9b91dff71so637437a91.2
        for <kvm-riscv@lists.infradead.org>; Wed, 26 Feb 2025 16:07:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1740614825; x=1741219625; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7nOMcPPI5c1jXJRM+8g52gTtzt6JEQOhHcXYY3HpyA0=;
        b=uEhE73mOsvk4M+Je3v4cfP3eqNr8mNIsXoQqowaX5b78cpnV3mZccpdt9Cu6JS36UG
         cARBl0TFw6Is5NmpcwOAN73F6uOjOkbUvA976LOlC9In932pDDIb1XvzuqHWheDFT1GG
         fbWPzXmJIsIZ7RIWgEVw7LMRecZmGjCxsbddwhVtP/bzyn3YSyUVswi1GNSslqarlUqe
         QbHEXxFMaxnIlyJFiw/zf+Y4ch3YjUSZOYUzMxKZCouVLkl+CWq90gJjqFxAirOIBUi5
         /W/rES7hvU1GLJhuitxbMZ3dEIlgaOcQMPA5yk4MeAGZxSLkcaACG3fIsCPJeiZ6xymi
         h2gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740614825; x=1741219625;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7nOMcPPI5c1jXJRM+8g52gTtzt6JEQOhHcXYY3HpyA0=;
        b=d1i7ssvCUhTTm6amSe1v76Oj0OpnFZXEX2SFlawkaZf0p7jVAIjqKZ0ZZ0IMctqQhL
         luppc6SYSF21ydymYutezaWodEvoM0GZXEsAkMW2tRWEgRgB4SnJ0D1mzaRxinVJmMWC
         g3gblxfNzO9F/f8Ts/mD+zIVjQSS8MeLT7ejXqi/5+4apzTxoBpUo5jywfdgvGU8hPZ0
         NZ09ieaHV9BToKkv9LSVCJEVMubti1wDnDMCahULVQawlfhKzFlsIKm5DP3rX/Mt+wjW
         1i3da9nqKdBOi4kt2wUVqIOZDNBO23evXfnns59KIcmn8auTEZcPMNwBzbh3tzr/9WW9
         9zVg==
X-Forwarded-Encrypted: i=1; AJvYcCVRdrzxTyNraeIhWrduvz16xnT4Q6tg9Ear7CecOvPyVG/ql5rsBCnQt1IDA8T1iOP5G8mG6spowDw=@lists.infradead.org
X-Gm-Message-State: AOJu0YzDnQt7jQwe2l2E/UxhnTXqpyoEnUKgojBrEZl48QMEB8zp79nP
	dsAUT3RBQ5uOdq65cObwqGQtHvM9WN7LQ07qW4R1R2JsepO2yhtwek08JwMvRcjKsv1gcKC2cgu
	sTBCNB6ZEMgI2CZx3wu8wXnbA+vpFNDwB0pR6Lw==
X-Gm-Gg: ASbGncvTybByvLOQVh6fMXr/HQwZZnBJZBqvpqppvJH84Xzt8naG/ZdrajVcoxyiP+8
	ugocqTZp3XfhB08Od/1CsIjT1APZyBgTfaWcXMTNwowjUV610cEM/wb/3s9t3UFAWK/P9S5A+J7
	N2I9afBg==
X-Google-Smtp-Source: AGHT+IFU1bq8mMWQr/nfAv06hNruBT5LhpE0t240NRVcR7JAq7ma1dPyg4mvl61oVDhks/31ToFVQUQ4SS/zaz0yHCw=
X-Received: by 2002:a17:90b:5446:b0:2ee:c04a:4276 with SMTP id
 98e67ed59e1d1-2fe7e2fad73mr7598919a91.5.1740614825599; Wed, 26 Feb 2025
 16:07:05 -0800 (PST)
MIME-Version: 1.0
References: <20250205-counter_delegation-v4-0-835cfa88e3b1@rivosinc.com>
 <20250205-counter_delegation-v4-9-835cfa88e3b1@rivosinc.com> <d03581a9-495d-47df-99f2-96065b06ee8f@rivosinc.com>
In-Reply-To: <d03581a9-495d-47df-99f2-96065b06ee8f@rivosinc.com>
From: Atish Kumar Patra <atishp@rivosinc.com>
Date: Wed, 26 Feb 2025 16:06:54 -0800
X-Gm-Features: AQ5f1Jor6j_JB-qT3VHcFUngBC7pDF2lQ8l_4vLXmUWI5FABCG8w44W6HyNkHE4
Message-ID: <CAHBxVyFxX78+zf3NFvRZ8sE6PV83gkQ0ibHMTPY7kr8HNr8naQ@mail.gmail.com>
Subject: Re: [PATCH v4 09/21] RISC-V: Add Ssccfg ISA extension definition and parsing
To: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, weilin.wang@intel.com, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-perf-users@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_000711_616534_1840FD46 
X-CRM114-Status: GOOD (  21.09  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

T24gRnJpLCBGZWIgNywgMjAyNSBhdCAxMjoxM+KAr0FNIENsw6ltZW50IEzDqWdlciA8Y2xlZ2Vy
QHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4KPgo+Cj4gT24gMDYvMDIvMjAyNSAwODoyMywgQXRpc2gg
UGF0cmEgd3JvdGU6Cj4gPiBTc2NjZmcgKOKAmFNz4oCZIGZvciBQcml2aWxlZ2VkIGFyY2hpdGVj
dHVyZSBhbmQgU3VwZXJ2aXNvci1sZXZlbAo+ID4gZXh0ZW5zaW9uLCDigJhjY2Zn4oCZIGZvciBD
b3VudGVyIENvbmZpZ3VyYXRpb24pIHByb3ZpZGVzIGFjY2VzcyB0bwo+ID4gZGVsZWdhdGVkIGNv
dW50ZXJzIGFuZCBuZXcgc3VwZXJ2aXNvci1sZXZlbCBzdGF0ZS4KPiA+Cj4gPiBUaGlzIHBhdGNo
IGp1c3QgZW5hYmxlcyB0aGUgZGVmaW5pdGlvbnMgYW5kIGVuYWJsZSBwYXJzaW5nLgo+ID4KPiA+
IFNpZ25lZC1vZmYtYnk6IEF0aXNoIFBhdHJhIDxhdGlzaHBAcml2b3NpbmMuY29tPgo+ID4gLS0t
Cj4gPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9od2NhcC5oIHwgMiArKwo+ID4gIGFyY2gvcmlz
Y3Yva2VybmVsL2NwdWZlYXR1cmUuYyB8IDIgKysKPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDQgaW5z
ZXJ0aW9ucygrKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3
Y2FwLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3Y2FwLmgKPiA+IGluZGV4IGI0ZWRkY2I1
Nzg0Mi4uZmE1ZTAxYmNiOTkwIDEwMDY0NAo+ID4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2Fz
bS9od2NhcC5oCj4gPiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3Y2FwLmgKPiA+IEBA
IC0xMDMsNiArMTAzLDggQEAKPiA+ICAjZGVmaW5lIFJJU0NWX0lTQV9FWFRfU1NDU1JJTkQgICAg
ICAgICAgICAgICA5NAo+ID4gICNkZWZpbmUgUklTQ1ZfSVNBX0VYVF9TTUNTUklORCAgICAgICAg
ICAgICAgIDk1Cj4gPiAgI2RlZmluZSBSSVNDVl9JU0FfRVhUX1NNQ05UUlBNRiAgICAgICAgIDk2
Cj4gPiArI2RlZmluZSBSSVNDVl9JU0FfRVhUX1NTQ0NGRyAgICAgICAgICAgIDk3Cj4gPiArI2Rl
ZmluZSBSSVNDVl9JU0FfRVhUX1NNQ0RFTEVHICAgICAgICAgIDk4Cj4gPgo+ID4gICNkZWZpbmUg
UklTQ1ZfSVNBX0VYVF9YTElOVVhFTlZDRkcgICAxMjcKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvYXJj
aC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVy
ZS5jCj4gPiBpbmRleCA4ZjIyNWM5YzMwNTUuLjNjYjIwOGQ0OTEzZSAxMDA2NDQKPiA+IC0tLSBh
L2FyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYwo+ID4gKysrIGIvYXJjaC9yaXNjdi9rZXJu
ZWwvY3B1ZmVhdHVyZS5jCj4gPiBAQCAtMzkwLDEyICszOTAsMTQgQEAgY29uc3Qgc3RydWN0IHJp
c2N2X2lzYV9leHRfZGF0YSByaXNjdl9pc2FfZXh0W10gPSB7Cj4gPiAgICAgICBfX1JJU0NWX0lT
QV9FWFRfQlVORExFKHp2a3NnLCByaXNjdl96dmtzZ19idW5kbGVkX2V4dHMpLAo+ID4gICAgICAg
X19SSVNDVl9JU0FfRVhUX0RBVEEoenZrdCwgUklTQ1ZfSVNBX0VYVF9aVktUKSwKPiA+ICAgICAg
IF9fUklTQ1ZfSVNBX0VYVF9EQVRBKHNtYWlhLCBSSVNDVl9JU0FfRVhUX1NNQUlBKSwKPiA+ICsg
ICAgIF9fUklTQ1ZfSVNBX0VYVF9EQVRBKHNtY2RlbGVnLCBSSVNDVl9JU0FfRVhUX1NNQ0RFTEVH
KSwKPgo+IEhpIEF0aXNoLAo+Cj4gYmFzZWQgb24geW91ciBkdC1iaW5kaW5nIGNvbW1pdCwgaWYg
c21jZGVsZWcgZGVwZW5kcyBvbiBTc2NzcmluZCwgWmlocG0sCj4gWmljbnRyLCB0aGVuIHlvdSBj
b3VsZCBhZGQgYSB2YWxpZGF0aW9uIGNhbGxiYWNrIGhlcmU6Cj4KClN1cmUuCgo+IHN0YXRpYyBp
bnQgcmlzY3Zfc21jZGVsZWdfdmFsaWRhdGUoY29uc3Qgc3RydWN0IHJpc2N2X2lzYV9leHRfZGF0
YQo+ICpkYXRhLCBjb25zdCB1bnNpZ25lZCBsb25nICppc2FfYml0bWFwKQo+IHsKPiAgICAgICAg
IGlmIChfX3Jpc2N2X2lzYV9leHRlbnNpb25fYXZhaWxhYmxlKGlzYV9iaXRtYXAsIFJJU0NWX0lT
QV9FWFRfU1NDU1JJTkQpICYmCj4gICAgICAgICAgICAgX19yaXNjdl9pc2FfZXh0ZW5zaW9uX2F2
YWlsYWJsZShpc2FfYml0bWFwLCBSSVNDVl9JU0FfRVhUX1pJSFBNKSAmJgo+ICAgICAgICAgICAg
IF9fcmlzY3ZfaXNhX2V4dGVuc2lvbl9hdmFpbGFibGUoaXNhX2JpdG1hcCwgUklTQ1ZfSVNBX0VY
VF9aSUNOVFIpKQo+ICAgICAgICAgICAgICAgICByZXR1cm4gMDsKPgo+ICAgICAgICAgcmV0dXJu
IC1FUFJPQkVfREVGRVI7Cj4gfQo+Cj4gX19SSVNDVl9JU0FfRVhUX0RBVEFfVkFMSURBVEUoc21j
ZGVsZWcsIFJJU0NWX0lTQV9FWFRfU01DREVMRUcsCj4gcmlzY3Zfc21jZGVsZWdfdmFsaWRhdGUp
LAo+Cj4gPiAgICAgICBfX1JJU0NWX0lTQV9FWFRfREFUQShzbWNudHJwbWYsIFJJU0NWX0lTQV9F
WFRfU01DTlRSUE1GKSwKPiA+ICAgICAgIF9fUklTQ1ZfSVNBX0VYVF9EQVRBKHNtY3NyaW5kLCBS
SVNDVl9JU0FfRVhUX1NNQ1NSSU5EKSwKPiA+ICAgICAgIF9fUklTQ1ZfSVNBX0VYVF9EQVRBKHNt
bXBtLCBSSVNDVl9JU0FfRVhUX1NNTVBNKSwKPiA+ICAgICAgIF9fUklTQ1ZfSVNBX0VYVF9TVVBF
UlNFVChzbW5wbSwgUklTQ1ZfSVNBX0VYVF9TTU5QTSwgcmlzY3ZfeGxpbnV4ZW52Y2ZnX2V4dHMp
LAo+ID4gICAgICAgX19SSVNDVl9JU0FfRVhUX0RBVEEoc21zdGF0ZWVuLCBSSVNDVl9JU0FfRVhU
X1NNU1RBVEVFTiksCj4gPiAgICAgICBfX1JJU0NWX0lTQV9FWFRfREFUQShzc2FpYSwgUklTQ1Zf
SVNBX0VYVF9TU0FJQSksCj4gPiArICAgICBfX1JJU0NWX0lTQV9FWFRfREFUQShzc2NjZmcsIFJJ
U0NWX0lTQV9FWFRfU1NDQ0ZHKSwKPgo+IERpdHRvIGZvciB0aGlzIG9uZSB3aXRoIFNtY2RlbGVn
LCBTc2NzcmluZCwgWmlocG0sIFppY250ciwgU3Njb2ZwbWYsCj4gU21jbnRycG1mLgo+CgpTbWNk
ZWxlZyBpcyBkZXBlbmRlbnQgb24gU3Njb2ZwbWYvU21jbnRycG1mIG9ubHkgZm9yIHNvbWUgb2Yg
dGhlIHJlZ2lzdGVycy4KRm9yIGV4YW1wbGUsIFNzY29mcG1mIGRlcGVuZGFuY3kgaXMgb25seSBm
b3Igc2lyZWcyIChocG1ldmVudDNoLWhwbWV2ZW50MzFoKQp3aGlsZSBTbWNudHJwbWYgaXMgb25s
eSBmb3IgY3ljbGVjZmcvaW5zdHJldGNmZ1sxXS4KClNvIHdlIGNhbid0IGluY2x1ZGUgdGhvc2Ug
Zm9yIHZhbGlkYXRpb24gYnV0IEkgd2lsbCBpbmNsdWRlIG90aGVyCmV4dGVuc2lvbnMgd2hpY2gg
YXJlIGFsd2F5cyByZXF1aXJlZC4KClsxXSBodHRwczovL2dpdGh1Yi5jb20vcmlzY3ZhcmNoaXZl
L3Jpc2N2LXNtY2RlbGVnLXNzY2NmZy9ibG9iL21haW4vYm9keS5hZG9jCj4gVGhhbmtzLAo+Cj4g
Q2zDqW1lbnQKPgo+ID4gICAgICAgX19SSVNDVl9JU0FfRVhUX0RBVEEoc3Njb2ZwbWYsIFJJU0NW
X0lTQV9FWFRfU1NDT0ZQTUYpLAo+ID4gICAgICAgX19SSVNDVl9JU0FfRVhUX0RBVEEoc3Njc3Jp
bmQsIFJJU0NWX0lTQV9FWFRfU1NDU1JJTkQpLAo+ID4gICAgICAgX19SSVNDVl9JU0FfRVhUX1NV
UEVSU0VUKHNzbnBtLCBSSVNDVl9JU0FfRVhUX1NTTlBNLCByaXNjdl94bGludXhlbnZjZmdfZXh0
cyksCj4gPgo+CgotLSAKa3ZtLXJpc2N2IG1haWxpbmcgbGlzdAprdm0tcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2t2
bS1yaXNjdgo=
