Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 891C1C982C1
	for <kvm-riscv@archiver.kernel.org>; Thu, 17 Sep 2026 01:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8QSuOt817B1Hae5Ma80XmAg88B3nC6JQm4CTpSykNRs=; b=mTcZZ2oaYDObrt
	N2MdcCOb4bJFFRwZWt7f6vbdHQxReikbJdcg7xylxRqkAqEL8LE/LTMOlCGSwdwQvIdKldqMAsOuc
	RG0roOkTjZJFDp0hkMZwYqfb5C8mruHs/fJ41Tv9GdJxksJ8HS1F0OiWK5LwJt9kc7lghz7ufmaiW
	rxvz+uuqcTyXGVq10RoJqUnDOtBDZ9LqO6uW2NYC0VHN6AiJIrht7gpYZ81edKrYlPNPPNEJlw5cK
	utPheY49wGOflQCbc8GJ8RvcWySx9cly3JCW9m/psh0HQBAyinufnSP/ecqCQ40mLUkugRGoJVJ7d
	fiYLaDjHBDkWnPj7snog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x717l-0000000AQEs-4AmZ;
	Thu, 17 Sep 2026 01:41:18 +0000
Received: from mail-pj2-x08.google.com ([2607:f8b0:4864:39::8])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x717j-0000000AQDz-2qb0
	for kvm-riscv@lists.infradead.org;
	Thu, 17 Sep 2026 01:41:17 +0000
Received: by mail-pj2-x08.google.com with SMTP id 98e67ed59e1d1-38fd9408220so64307a91.1
        for <kvm-riscv@lists.infradead.org>; Wed, 16 Sep 2026 18:41:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789609274; x=1790214074; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=phs6j4c6GSVsgWqjzCyy6AX6x537GMsS5N7HEcIYNoA=;
        b=AqguBzx0yDRAKKXTB2nDIINZEsdLVizriG7Uwgm8FWPWZrPFfEebEsyCs8gwPNZkz/
         gGASOtCxCXU5gcDod7z/UesMWABvIfE+Sr7+AcYuauOjf1iDAicKDEcF0Sukx3T1K87F
         S/EwaX7nwiyID0YoDxGU6LHdHnc1ThT3YpwkDxvjh98bxyXjZ8WHw1AXf60EiCvcu6l0
         IqoSaA7xBz0qR75kAwSZm2Q32rNpyLkAtt73VN+oyubAXXPIv/kpPVmgHJaUEbnFxGCu
         toWQ7kBb7Rl78/ptZ+TQFjTjNi1zXquwI3xa3e889RzpOIDHSv+q0dlH68rS73MufIjA
         f1zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789609274; x=1790214074;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=phs6j4c6GSVsgWqjzCyy6AX6x537GMsS5N7HEcIYNoA=;
        b=EPLUH7OFC6s2YYMuky29zPk5Q0RP6x9V4CwJ3ZjB1nGi/qvap2cvmRczUrnFVUNfyz
         xaiTZ9sfJUSwlTS2WIIqLz4SsCA/kSQYISva9Glg29FXFV3fS48PyZbo/ZhfoOVoVdBJ
         75pPYGEBlSpZbYGXE2YHwwRDu+ou/tv8OrZmNPXekfxbsZQhOjvyiBEQ2BpAu8ILxGNU
         0ZZuStHrDOcdvH9kcblqNpUDqNEDI5vSsEVxZACu2R1lN+ZXrNOCXrGdYtXRW+6Vi+NV
         QFH0988IJesp8Omcjz3TSg+3dPGVg6yoGWVIDEr2f8uWbAkatGhn7nmH+jM40yC1Hawu
         2Rrg==
X-Forwarded-Encrypted: i=1; AKwUvBwGZuVjGpFE3frz9J+CLFBVyTeW+7Xkoctpudy9XkwGyBrknk0SXgINB3LikjlZe5J8lOtco2kh4MY=@lists.infradead.org
X-Gm-Message-State: AFuF++lvNy68243dI0LLoyBec2Z9mQ1p2v6lEWILIaSX1KGAn3nxu8Dh
	SzOCII08x6zDWKt1Z7BVTHTu2tfo6eXLIzDrLZRFcVL1EXoA198JdBuV
X-Gm-Gg: AYBFou39wIuxkyqro3KMsjRuCWmW1cOsItuZfKsPKj1XUXjd/YK/b5EAf7jrgY3rckF
	D8CVDXFE4kkt7fJxj7fCvi9fZlakS8ozWXwOMWEKgq1Hzjuf53iUlJ2b0vRwvQHAyqMb7fHKv0O
	bMy3+a3LbbC4yeSAt3qN92uyU/kNBcX4WjBPHQ/HXW6FGsnwm1EPUw7P+qScuHjzcaV7JMoKCj3
	9XxKGduWH35+r0ZMja/5RCrdDYS/09Leu4Qg/43BsFZi2S0rhtnGEHtvcWDOb1aADSiLOuBn+5+
	HFJsCUj8n8oPs5OoaC6y7t2UJZdm7SF+mu27IZX+xNJ0l+DhupoJqg7OJAWdmIXkHtK1dinDjKq
	I0aFCZuLS42e84l+Cvpx2lmaXQn5Yqz24YXiC0R18EQWxr5v5bbCSx/2QKRY7SQcUiiJj7RABpP
	dDd3GVRAZDXms2GjR3OOYeu2fkwBuhmchCM6uiC6qRFN/HyUMeCblqln6SEmwt1BWgMLeE80dVw
	9oLJnRrDw/5LZV1/fMcwAXUb8RPKsTbd2bkdkoLTwAF7ZLDMlBdLA==
X-Received: by 2002:a17:90b:3b41:b0:38c:a59b:5189 with SMTP id 98e67ed59e1d1-39e1e48a416mr10022482a91.15.1789609273770;
        Wed, 16 Sep 2026 18:41:13 -0700 (PDT)
Received: from ?IPV6:2409:8900:87c0:1605:195c:9057:4549:3b0b? ([2409:8900:87c0:1605:195c:9057:4549:3b0b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e3618ab38sm1949715a91.10.2026.09.16.18.41.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 18:41:13 -0700 (PDT)
Message-ID: <8530f6cf-3c61-4bd1-871d-b589ef0412bd@gmail.com>
Date: Thu, 17 Sep 2026 09:40:57 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v4 00/10] iommu/riscv: Add hardware dirty tracking for
 second-stage domains
To: fangyu.yu@linux.alibaba.com
Cc: guoren@kernel.org, iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org,
 tomasz.jeznach@linux.dev, joro@8bytes.org, will@kernel.org,
 robin.murphy@arm.com, pjw@kernel.org, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, baolu.lu@linux.intel.com,
 jroedel@suse.de, zong.li@sifive.com, andrew.jones@oss.qualcomm.com,
 anup@brainfault.org, jgg@nvidia.com, jgg@ziepe.ca, kevin.tian@intel.com,
 atish.patra@linux.dev, skhawaja@google.com, vasant.hegde@amd.com,
 joerg.roedel@amd.com, gong.shuai@sanechips.com.cn
References: <20260915032828.11250-1-fangyu.yu@linux.alibaba.com>
From: Gong Shuai <gsh517025@gmail.com>
In-Reply-To: <20260915032828.11250-1-fangyu.yu@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_184115_727097_B31C5465 
X-CRM114-Status: GOOD (  21.53  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

T24gOS8xNS8yMDI2IDExOjI4IEFNLCBmYW5neXUueXVAbGludXguYWxpYmFiYS5jb20gd3JvdGU6
Cj4gRnJvbTogRmFuZ3l1IFl1IDxmYW5neXUueXVAbGludXguYWxpYmFiYS5jb20+Cj4gCj4gVGhl
IFJJU0MtViBJT01NVSBhcmNoaXRlY3R1cmUgZGVmaW5lcyBhbiBBTU9fSFdBRCBjYXBhYmlsaXR5
IChIYXJkd2FyZQo+IEFjY2Vzcy9EaXJ0eSB1cGRhdGUpIHRoYXQgYWxsb3dzIHRoZSBJT01NVSB0
byBhdG9taWNhbGx5IHNldCB0aGUgQS9EIGJpdHMKPiBpbiBzZWNvbmQtc3RhZ2UgUFRFcyBvbiBE
TUEgYWNjZXNzLiAgV2hlbiBEQy50Yy5HQURFIGlzIGFzc2VydGVkLCB0aGUgSU9NTVUKPiBhdXRv
bm9tb3VzbHkgc2V0cyBEIG9uIHRoZSBmaXJzdCB3cml0ZSB0byBhIHBhZ2UgbWFwcGVkIGJ5IGFu
IGlvaGdhdHAKPiBkb21haW4uICBUaGlzIHNlcmllcyB3aXJlcyB0aGF0IGNhcGFiaWxpdHkgdXAg
dG8gdGhlIGlvbW11ZmQgZGlydHktdHJhY2tpbmcKPiBpbnRlcmZhY2UgKElPTU1VX0hXUFRfU0VU
X0RJUlRZX1RSQUNLSU5HIC8gSU9NTVVfSFdQVF9HRVRfRElSVFlfQklUTUFQKSBhbmQKPiByZXBv
cnRzIElPTU1VX0NBUF9ESVJUWV9UUkFDS0lORy4KPiAKPiBEZXNpZ24gbm90ZXMKPiAtLS0tLS0t
LS0tLS0KPiAKPiAqIFRoZSBmZWF0dXJlIGlzIHNjb3BlZCB0byBzZWNvbmQtc3RhZ2UgKGlvaGdh
dHApIGRvbWFpbnMgb25seTsgdGhlc2UgYXJlCj4gICAgdGhlIGRvbWFpbnMgY3JlYXRlZCBmb3Ig
S1ZNIC8gVkZJTyBkZXZpY2UgcGFzcy10aHJvdWdoIHdoZW4gdXNlcnNwYWNlCj4gICAgYWxsb2Nh
dGVzIGFuIEhXUFQgd2l0aCBJT01NVV9IV1BUX0FMTE9DX05FU1RfUEFSRU5UIG9yCj4gICAgSU9N
TVVfSFdQVF9BTExPQ19ESVJUWV9UUkFDS0lORy4gIEZpcnN0LXN0YWdlIChpb3NhdHApIGRvbWFp
bnMgYXJlIG5vdAo+ICAgIHRvdWNoZWQgYnkgdGhpcyBzZXJpZXMuCj4gCj4gKiBUaGUgcGFnZS10
YWJsZSBzaWRlIHBsdWdzIGludG8gdGhlIGV4aXN0aW5nIGdlbmVyaWNfcHQgZGlydHkgaG9vawo+
ICAgIGZyYW1ld29yayAoYW1kdjEgLyB2dGRzcyBzdHlsZSkuICBSSVNDLVYgYWRkcyB0aGUgdGhy
ZWUgcmVxdWlyZWQgUFRFCj4gICAgb3BzIOKAkyBpc193cml0ZV9kaXJ0eSAvIG1ha2Vfd3JpdGVf
Y2xlYW4gLyBtYWtlX3dyaXRlX2RpcnR5Lgo+IAo+IFRlc3RpbmcKPiAtLS0tLS0tCj4gCj4gKiBU
ZXN0IG9uIFFFTVUgUklTQy1WLCBhIG52bWUgYW5kIGFuIGUxMDAwZSBkZXZpY2Ugd2FzIHBhc3Nl
ZCB0aHJvdWdoCj4gICAgdG8gYW4gTDIgZ3Vlc3QgdmlhIHZmaW8tcGNpICsgaW9tbXVmZC4KPiAK
PiAqIGdlbmVyaWNfcHQgS1VuaXQ6IHRoZSBleGlzdGluZyB0ZXN0X2RpcnR5IGNhc2Ugbm93IHJ1
bnMgYW5kIHBhc3NlcyBmb3IKPiAgICB0aGUgUklTQy1WIDY0LWJpdCBmb3JtYXQuCj4gCj4gRm9s
bG93LXVwIHdvcmsKPiAtLS0tLS0tLS0tLS0tLQo+ICogQnVpbGQgYSBkZWRpY2F0ZWQgZW5kLXRv
LWVuZCB0ZXN0IGNhc2UgdGhhdCBkcml2ZXMgdGhlIGZ1bGwgZmxvdwo+ICAgIChIV1BUX0FMTE9D
IHdpdGggRElSVFlfVFJBQ0tJTkcgLT4gYXR0YWNoIC0+IElPQVNfTUFQIC0+IGdlbmVyYXRlIHJl
YWwKPiAgICBETUEgLT4gU0VUX0RJUlRZX1RSQUNLSU5HIC0+IEdFVF9ESVJUWV9CSVRNQVAgLT4g
dmVyaWZ5IGJpdG1hcCBhZ2FpbnN0Cj4gICAgZXhwZWN0ZWQgSU9WQSBmb290cHJpbnQpIHNvIHRo
YXQgdGhlIGJlaGF2aW91ciBjYW4gYmUgcmVncmVzc2lvbi10ZXN0ZWQKPiAgICBiZXlvbmQgdGhl
IEtVbml0IFBURS1sZXZlbCBjb3ZlcmFnZS4KPiAKPiAqIElmIHBvc3NpYmxlLCByZWJhc2UgYW5k
IHJldGVzdCBvbiB0b3Agb2YgdGhlIHVwZGF0ZWQgImlvbW11IGlycWJ5cGFzcyIKPiAgICBwYXRj
aHNldC4KPiAKPiAtLS0KPiBDaGFuZ2VzIGluIHY0IChKYXNvbidzIHN1Z2dlc3Rpb25zKToKPiAg
ICAgIC0gUmViYXNlZCB0aGUgc2VyaWVzIG9uIHRvcCBvZiBbMV0gYW5kIFsyXS4KPiAgICAgIC0g
RHJvcCB0aGUgUklTQy1WLXNwZWNpZmljIHB0X251bV9pdGVtc19sZzIoKSB0b3AtbGV2ZWwgc3Bl
Y2lhbCBjYXNlLgo+ICAgICAgLSBWYWxpZGF0ZSBwYWdlLXRhYmxlIGFkZHJlc3Mgd2lkdGhzIGJ5
IHRyYW5zbGF0aW9uIHN0YWdlOiBhY2NlcHQgb25seQo+ICAgICAgICBTdjM5L1N2NDgvU3Y1NyB3
aWR0aHMgZm9yIGZpcnN0LXN0YWdlIHRhYmxlcyBhbmQgb25seSBTdjM5eDQvU3Y0OHg0Lwo+ICAg
ICAgICBTdjU3eDQgd2lkdGhzIGZvciBzZWNvbmQtc3RhZ2UgdGFibGVzLgo+ICAgICAgLSBSZXBs
YWNlIHRoZSBhbGlhc2VkIGZpcnN0LXN0YWdlL3NlY29uZC1zdGFnZSBNT0RFIHVuaW9uIHdpdGgK
PiAgICAgICAgaW5kZXBlbmRlbnQgRlNDL0lPU0FUUCBhbmQgSU9IR0FUUCBNT0RFIGZpZWxkcy4K
PiAgICAgIC0gQWRkIHB0X2RpcnR5X3N1cHBvcnRlZCgpIHRvIHJlc3RyaWN0IFJJU0MtViBnZW5l
cmljX3B0IGRpcnR5IHRyYWNraW5nCj4gICAgICAgIHRvIHNlY29uZC1zdGFnZSB0YWJsZXMuCj4g
ICAgICAtIExpbmsgdG8gdjM6Cj4gICAgICAgIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4
LXJpc2N2LzIwMjYwODIxMTMyNzQ5LjgyMDcwLTEtZmFuZ3l1Lnl1QGxpbnV4LmFsaWJhYmEuY29t
Lwo+IENoYW5nZXMgaW4gdjMgKEFuZHJldyBKb25lcydzIHN1Z2dlc3Rpb25zKToKPiAgICAgIC0g
UmViYXNlZCB0aGUgc2VyaWVzIG9uIHRvcCBvZiBBbmRyZXcgSm9uZXMnIGdlbmVyaWNfcHQgUklT
Qy1WIHN1cHBvcnRlZAo+ICAgICAgICBmZWF0dXJlIG1hc2sgZml4LCB3aGljaCBhZGRzIFBUX0ZF
QVRfUklTQ1ZfU1ZQQk1UIHRvIHRoZSBzdXBwb3J0ZWQgZmVhdHVyZQo+ICAgICAgICBzZXQuCj4g
ICAgICAtIEFkZGVkIFBUX0ZFQVRfUklTQ1ZfUzIgdG8gdGhlIFJJU0MtViBnZW5lcmljX3B0IHN1
cHBvcnRlZCBmZWF0dXJlIG1hc2sgYW5kCj4gICAgICAgIEtVbml0IGZlYXR1cmUgbWF0cml4Lgo+
ICAgICAgLSBLZXB0IFBUX0ZFQVRfU0lHTl9FWFRFTkQgb25seSBmb3IgZmlyc3Qtc3RhZ2UgUklT
Qy1WIEtVbml0IGNvbmZpZ3M7IHNlY29uZAo+ICAgICAgICBzdGFnZSBjb25maWdzIG5vdyB1c2Ug
UFRfRkVBVF9SSVNDVl9TMiB3aXRob3V0IHNpZ24tZXh0ZW5zaW9uIHNlbWFudGljcy4KPiAgICAg
IC0gU3BsaXQgUklTQy1WIElPTU1VIGNhcGFiaWxpdHkgY2hlY2tzIGludG8gZmlyc3Qtc3RhZ2Ug
RlNDIGFuZCBzZWNvbmQtc3RhZ2UKPiAgICAgICAgSU9IR0FUUCBoZWxwZXJzLgo+ICAgICAgLSBV
cGRhdGVkIHNlY29uZC1zdGFnZSBwYWdpbmcgZG9tYWluIHNldHVwIHRvIHVzZSBHUEEgd2lkdGhz
IDQxLzUwLzU5IGFuZCB0bwo+ICAgICAgICBhdm9pZCBQVF9GRUFUX1NJR05fRVhURU5ELgo+ICAg
ICAgLSBMaW5rIHRvIHYyOgo+ICAgICAgICBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1y
aXNjdi8yMDI2MDUwNzExMzcwNi4xMTQwMC0xLWZhbmd5dS55dUBsaW51eC5hbGliYWJhLmNvbS8K
PiBDaGFuZ2VzIGluIHYyIChKYXNvbidzIHN1Z2dlc3Rpb25zKToKPiAgICAgIC0gSW50cm9kdWNl
ZCBhIHNpbmdsZSBQVF9GRUFUX1JJU0NWX1MyOiBzZWNvbmQtc3RhZ2Ugc2VsZWN0aW9uIGlzIGRy
aXZlbgo+ICAgICAgICBwdXJlbHkgYnkgdGhpcyBmZWF0dXJlIGJpdC4KPiAgICAgIC0gU3dpdGNo
ZWQgZnJvbSBkeW5hbWljIERDLnRjLkdBREUgdG9nZ2xpbmcgdG8gc3RhdGljIHByZS1lbmFibGUu
Cj4gICAgICAtIGRvbWFpbl9hbGxvY19wYWdpbmdfZmxhZ3M6IGZvbGxvdyB0aGUgc3dpdGNoL2Nh
c2UgZGVzaWduIGZyb20gb3RoZXIKPiAgICAgICAgZHJpdmVycy4KPiAgICAgIC0gRHJvcCBJT01N
VV9DQVBfREVGRVJSRURfRkxVU0ggaW4gcmlzY3ZfaW9tbXVfY2FwYWJsZS4KPiAgICAgIC0gUmVt
b3ZlIHRoZSAuaHdfaW5mby1yZWxhdGVkIHBhdGNoLgo+ICAgICAgLSBMaW5rIHRvIHYxOgo+ICAg
ICAgICBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1yaXNjdi8yMDI2MDQyODEzMTM1OS4z
NDg3Mi0xLWZhbmd5dS55dUBsaW51eC5hbGliYWJhLmNvbS8KPiAKPiBbMV0gaHR0cHM6Ly9sb3Jl
Lmtlcm5lbC5vcmcvbGludXgtaW9tbXUvMS12Mi01NjNlZTYzODg2ZjArMTIwOS1pb21tdXB0X2Fy
bXY4X2pnZ0BudmlkaWEuY29tLwo+IFsyXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1p
b21tdS8yMDI2MDgxODA5MjQ0NC40Mjc1NS0xLWFuZHJldy5qb25lc0Bvc3MucXVhbGNvbW0uY29t
Lwo+IAo+IEZhbmd5dSBZdSAoNik6Cj4gICAgaW9tbXVwdDogQWRkIFJJU0MtViBTZWNvbmQtc3Rh
Z2UgKGlvaGdhdHApIHBhZ2UgdGFibGUgc3VwcG9ydAo+ICAgIGlvbW11cHQ6IEFkZCBSSVNDLVYg
ZGlydHkgdHJhY2tpbmcgUFRFIG9wcwo+ICAgIGlvbW11L3Jpc2N2OiBBZGQgZG9tYWluX2FsbG9j
X3BhZ2luZ19mbGFncyBmb3Igc2Vjb25kLXN0YWdlIGRvbWFpbgo+ICAgIGlvbW11L3Jpc2N2OiBQ
cmUtZW5hYmxlIEdBREUgZm9yIHNlY29uZC1zdGFnZSBkb21haW5zZ29uCj4gICAgaW9tbXUvcmlz
Y3Y6IEFkZCBkaXJ0eSB0cmFja2luZyBzdXBwb3J0IGZvciBzZWNvbmQtc3RhZ2UgZG9tYWlucwo+
ICAgIGlvbW11L3Jpc2N2OiBBZGQgSU9USU5WQUwuR1ZNQSBhZnRlciB1cGRhdGluZyBERFQvUERU
IGVudHJpZXMKCkhpIEZhbmd5dSwKClRoaXMgcGF0Y2ggKDEwLzEwKSBpcyBtaXNzaW5nIGZyb20g
dGhpcyBzZXJpZXMuCkl0IHdhcyBhbHNvIG1pc3NpbmcgaW4gUkZDIHYzLgoKVGhhbmtzLApTaHVh
aQoKPiAKPiBUb21hc3ogSmV6bmFjaCAoMik6Cj4gICAgaW9tbXUvcmlzY3Y6IHJlcG9ydCBpb21t
dSBjYXBhYmlsaXRpZXMKPiAgICBSSVNDLVY6IEtWTTogRW5hYmxlIEtWTV9WRklPIGludGVyZmFj
ZXMgb24gUklTQy1WIGFyY2gKPiAKPiBab25nIExpICgyKToKPiAgICBpb21tdS9yaXNjdjogdXNl
IGRhdGEgc3RydWN0dXJlIGluc3RlYWQgb2YgaW5kaXZpZHVhbCB2YWx1ZXMKPiAgICBpb21tdS9y
aXNjdjogc3VwcG9ydCBHU0NJRCBhbmQgR1ZNQSBpbnZhbGlkYXRpb24gY29tbWFuZAo+IAo+ICAg
YXJjaC9yaXNjdi9rdm0vS2NvbmZpZyAgICAgICAgICAgICAgICAgICAgICAgfCAgIDIgKwo+ICAg
ZHJpdmVycy9pb21tdS9nZW5lcmljX3B0L2ZtdC9pb21tdV9yaXNjdjY0LmMgfCAgIDIgKy0KPiAg
IGRyaXZlcnMvaW9tbXUvZ2VuZXJpY19wdC9mbXQvcmlzY3YuaCAgICAgICAgIHwgMTU4ICsrKysr
KysrKysrLS0KPiAgIGRyaXZlcnMvaW9tbXUvcmlzY3YvaW9tbXUtYml0cy5oICAgICAgICAgICAg
IHwgICA3ICsKPiAgIGRyaXZlcnMvaW9tbXUvcmlzY3YvaW9tbXUuYyAgICAgICAgICAgICAgICAg
IHwgMjI0ICsrKysrKysrKysrKysrKy0tLS0KPiAgIGluY2x1ZGUvbGludXgvZ2VuZXJpY19wdC9j
b21tb24uaCAgICAgICAgICAgIHwgICA0ICsKPiAgIGluY2x1ZGUvbGludXgvZ2VuZXJpY19wdC9p
b21tdS5oICAgICAgICAgICAgIHwgIDExICsKPiAgIDcgZmlsZXMgY2hhbmdlZCwgMzM2IGluc2Vy
dGlvbnMoKyksIDcyIGRlbGV0aW9ucygtKQo+IAoKCi0tIAprdm0tcmlzY3YgbWFpbGluZyBsaXN0
Cmt2bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2Cg==
