Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 738F9C282EC
	for <kvm-riscv@archiver.kernel.org>; Fri, 14 Mar 2025 13:54:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dXu/Ezzdt5OZV9+9/IMsHPwgd3bfNOccc4shseDUukE=; b=OLm8gwXwl6MYny
	wtuzJhYAi2ifDZe7O3eMcsc2HC0dqUnYPUh3edr9/ZWkf0FLMeqPtXh94s42Usbta/omVoOJ76wYh
	zwTw6EUsjbdw2a9CgnWmUrX168/fFyHDDQ99N1xtF1T9aXFF0OK/kG5gZ2netv/1sqVURYmyUe6c6
	meguL8CZDR8sdtY9ThqySvhP1PQbUxgX7FC3NL03Dx9qc1D+G9lnY39xAmNIgHfTGvC1NF0coLymn
	7Njc4y+y1hnEGB/9ahxBQjqGXMsIE9CfE31L/HV6eoRlGwj1kP2f3rRDk+JyboS39pAIqw/YUeQiY
	owoppTKp7oNGFMUrYedw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt5Ul-0000000EKvt-0igE;
	Fri, 14 Mar 2025 13:54:39 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt5U9-0000000EKoM-2kGO
	for kvm-riscv@lists.infradead.org;
	Fri, 14 Mar 2025 13:54:03 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4394345e4d5so14505005e9.0
        for <kvm-riscv@lists.infradead.org>; Fri, 14 Mar 2025 06:54:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1741960440; x=1742565240; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Fagz20QrFuAHZhTQ6FrQZLAd/rBpo65R2q5CpO1e6Ms=;
        b=b6ZgSR7k2CWNX9CS47g3sW/qBQ2aF1pignIhtHOXhxuFZqvfSEDmp+YV/2hVh7LrAA
         pKFrOgd6LlD+yYnvHT+8/bWpo+h7nBHcjJBkaHVYgIMcBs0e/moLFJL/Acjko8LXMlqd
         0bsOmpGwA6Y0I7kAgm+Umc8OEH77Q+Urb0ndFlraULgnt70TRGRYg5Ez6ulXqi2PW0Aa
         gZvcE1HqBHBABVXZHQB/+XROSN+nRGADrGE9YcrZfIqMWTndABIDLXEKhxNNqHL2R6V/
         TNPGhdv4q0/1LEwl+BI9pV5IwEBts/60fOzMx5RsFF9Hc+SLuEAP7Z0RphWKiGDzuyPs
         dh7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741960440; x=1742565240;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Fagz20QrFuAHZhTQ6FrQZLAd/rBpo65R2q5CpO1e6Ms=;
        b=sQJ1KnwENpFFnbDhqu/OR7yCRqiNeXbXyiw20pwNQ/XXJX2MwBMaaAush+b8RIQM5Q
         vugEwKDULGGZxnbBzTW21GvfP3PhxAC80YfoVYPpiQnXW4+mW7+Hq1+as3MrSOpjZYb7
         u2qW9U7UcT21X/PtqrvEJDNL5FDjyguZOh9qePQw5cBD6bVwwqXGdfvaeotebHlvv5vi
         3XvhFgf4Ahmm0KNkjNxYPPY0DcQwlL9vnebJUyHI8j8bwQIVPFPweenITrMriAE4iSmO
         dB/Ifqu1Ajbh60/1TSinojHSf45igqoDEi8cS1Ojdz/HyvhKbrmtIqvEqIVCvuskPiM7
         BGyA==
X-Forwarded-Encrypted: i=1; AJvYcCUUpi9qOajYZehTmem6d9NIb+cspA4t/fw+tXbT7kzPDnNK2G6ORtMRaMPlG9AzVSys6Kw6Cl0J/K0=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8z+OLXjSRH50nj8zbyJ1OKoZY6bmRnwW0us7N4FXbH4WxmUEL
	y4MDzC/dJQtKJW+ZG49hmcycLaa2Xf/DLFqtoDt7IrR6BPRCGa05v6d3C5Lk5YoOeS+wAmzgR2W
	MZdA=
X-Gm-Gg: ASbGncsqw3NMjShBKEz1n+BQRac/9ug+jI2+fwH5sIGvyWrG8giWH01BZvN1Bm3cLJz
	JMuyrVji2RmY833iGJmrdTr1zSFzIfdBM0rKFQ4x+TdX8I9L+k0S4TCwn2Kx3/1I8NTrSZ1coHJ
	BIYOjBc2GKyN6rsxkhUalH2OlDvsaOwmwTG/Y5ZZ3rBKqyRDIZEPeSQ6g2YvQR4TyCf7/BEpPvJ
	GE1o9DwLQjRvOaw/5AngDJf+4NhLuTVL1thjoY9W+wxUNacz+OsaWNBmR7TfhqB6Vi5h1YDhkxe
	BM7oHVJPFQq/x40J+LCoHr5KZQReDaMZtWr6I8bkNAJEDsKDjf1/2DKv+sjy/NTWKEtArW4Lokq
	j9CM2g2ZKEUi5OA==
X-Google-Smtp-Source: AGHT+IFiUfIYzj4rjDfIocFY+Zq89FGHUz0Fh/cjhy+mbnj+WnaTwAetyDwYahJAg/CF95TRVy0QHw==
X-Received: by 2002:a05:6000:2a6:b0:391:1806:e23d with SMTP id ffacd0b85a97d-3971d03d1b7mr3515213f8f.6.1741960439864;
        Fri, 14 Mar 2025 06:53:59 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395cb7eb8c2sm5503118f8f.85.2025.03.14.06.53.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Mar 2025 06:53:59 -0700 (PDT)
Message-ID: <ed45849c-12b6-446e-b7ad-3e0469378b4d@rivosinc.com>
Date: Fri, 14 Mar 2025 14:53:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 14/17] RISC-V: KVM: add SBI extension init()/deinit()
 functions
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>,
 Atish Patra <atishp@atishpatra.org>, Shuah Khan <shuah@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-kselftest@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>
References: <20250310151229.2365992-1-cleger@rivosinc.com>
 <20250310151229.2365992-15-cleger@rivosinc.com>
 <20250313-f08cee46c912f729d1829d37@orel>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20250313-f08cee46c912f729d1829d37@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_065401_703038_766A126C 
X-CRM114-Status: GOOD (  22.09  )
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

CgpPbiAxMy8wMy8yMDI1IDE1OjI3LCBBbmRyZXcgSm9uZXMgd3JvdGU6Cj4gT24gTW9uLCBNYXIg
MTAsIDIwMjUgYXQgMDQ6MTI6MjFQTSArMDEwMCwgQ2zDqW1lbnQgTMOpZ2VyIHdyb3RlOgo+PiBU
aGUgRldGVCBTQkkgZXh0ZW5zaW9uIHdpbGwgbmVlZCB0byBkeW5hbWljYWxseSBhbGxvY2F0ZSBt
ZW1vcnkgYW5kIGRvCj4+IGluaXQgdGltZSBzcGVjaWZpYyBpbml0aWFsaXphdGlvbi4gQWRkIGFu
IGluaXQvZGVpbml0IGNhbGxiYWNrcyB0aGF0Cj4+IGFsbG93cyB0byBkbyBzby4KPj4KPj4gU2ln
bmVkLW9mZi1ieTogQ2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3NpbmMuY29tPgo+PiAtLS0K
Pj4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20va3ZtX3ZjcHVfc2JpLmggfCAgOSArKysrKysrKysK
Pj4gIGFyY2gvcmlzY3Yva3ZtL3ZjcHUuYyAgICAgICAgICAgICAgICAgfCAgMiArKwo+PiAgYXJj
aC9yaXNjdi9rdm0vdmNwdV9zYmkuYyAgICAgICAgICAgICB8IDI5ICsrKysrKysrKysrKysrKysr
KysrKysrKysrKwo+PiAgMyBmaWxlcyBjaGFuZ2VkLCA0MCBpbnNlcnRpb25zKCspCj4+Cj4+IGRp
ZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV92Y3B1X3NiaS5oIGIvYXJjaC9y
aXNjdi9pbmNsdWRlL2FzbS9rdm1fdmNwdV9zYmkuaAo+PiBpbmRleCA0ZWQ2MjAzY2RkMzAuLmJj
YjkwNzU3YjE0OSAxMDA2NDQKPj4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1fdmNw
dV9zYmkuaAo+PiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV92Y3B1X3NiaS5oCj4+
IEBAIC00OSw2ICs0OSwxNCBAQCBzdHJ1Y3Qga3ZtX3ZjcHVfc2JpX2V4dGVuc2lvbiB7Cj4+ICAK
Pj4gIAkvKiBFeHRlbnNpb24gc3BlY2lmaWMgcHJvYmUgZnVuY3Rpb24gKi8KPj4gIAl1bnNpZ25l
ZCBsb25nICgqcHJvYmUpKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSk7Cj4+ICsKPj4gKwkvKgo+PiAr
CSAqIEluaXQvZGVpbml0IGZ1bmN0aW9uIGNhbGxlZCBvbmNlIGR1cmluZyBWQ1BVIGluaXQvZGVz
dHJveS4gVGhlc2UKPj4gKwkgKiBtaWdodCBiZSB1c2UgaWYgdGhlIFNCSSBleHRlbnNpb25zIG5l
ZWQgdG8gYWxsb2NhdGUgb3IgZG8gc3BlY2lmaWMKPj4gKwkgKiBpbml0IHRpbWUgb25seSBjb25m
aWd1cmF0aW9uLgo+PiArCSAqLwo+PiArCWludCAoKmluaXQpKHN0cnVjdCBrdm1fdmNwdSAqdmNw
dSk7Cj4+ICsJdm9pZCAoKmRlaW5pdCkoc3RydWN0IGt2bV92Y3B1ICp2Y3B1KTsKPj4gIH07Cj4+
ICAKPj4gIHZvaWQga3ZtX3Jpc2N2X3ZjcHVfc2JpX2ZvcndhcmQoc3RydWN0IGt2bV92Y3B1ICp2
Y3B1LCBzdHJ1Y3Qga3ZtX3J1biAqcnVuKTsKPj4gQEAgLTY5LDYgKzc3LDcgQEAgY29uc3Qgc3Ry
dWN0IGt2bV92Y3B1X3NiaV9leHRlbnNpb24gKmt2bV92Y3B1X3NiaV9maW5kX2V4dCgKPj4gIGJv
b2wgcmlzY3ZfdmNwdV9zdXBwb3J0c19zYmlfZXh0KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgaW50
IGlkeCk7Cj4+ICBpbnQga3ZtX3Jpc2N2X3ZjcHVfc2JpX2VjYWxsKHN0cnVjdCBrdm1fdmNwdSAq
dmNwdSwgc3RydWN0IGt2bV9ydW4gKnJ1bik7Cj4+ICB2b2lkIGt2bV9yaXNjdl92Y3B1X3NiaV9p
bml0KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSk7Cj4+ICt2b2lkIGt2bV9yaXNjdl92Y3B1X3NiaV9k
ZWluaXQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1KTsKPj4gIAo+PiAgaW50IGt2bV9yaXNjdl92Y3B1
X2dldF9yZWdfc2JpX3N0YShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIHVuc2lnbmVkIGxvbmcgcmVn
X251bSwKPj4gIAkJCQkgICB1bnNpZ25lZCBsb25nICpyZWdfdmFsKTsKPj4gZGlmZiAtLWdpdCBh
L2FyY2gvcmlzY3Yva3ZtL3ZjcHUuYyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHUuYwo+PiBpbmRleCA2
MGQ2ODRjNzZjNTguLjg3N2JjYzg1YzA2NyAxMDA2NDQKPj4gLS0tIGEvYXJjaC9yaXNjdi9rdm0v
dmNwdS5jCj4+ICsrKyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHUuYwo+PiBAQCAtMTg1LDYgKzE4NSw4
IEBAIHZvaWQga3ZtX2FyY2hfdmNwdV9wb3N0Y3JlYXRlKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSkK
Pj4gIAo+PiAgdm9pZCBrdm1fYXJjaF92Y3B1X2Rlc3Ryb3koc3RydWN0IGt2bV92Y3B1ICp2Y3B1
KQo+PiAgewo+PiArCWt2bV9yaXNjdl92Y3B1X3NiaV9kZWluaXQodmNwdSk7Cj4+ICsKPj4gIAkv
KiBDbGVhbnVwIFZDUFUgQUlBIGNvbnRleHQgKi8KPj4gIAlrdm1fcmlzY3ZfdmNwdV9haWFfZGVp
bml0KHZjcHUpOwo+PiAgCj4+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2t2bS92Y3B1X3NiaS5j
IGIvYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmkuYwo+PiBpbmRleCBkMWM4M2E3NzczNWUuLjg1OGRk
ZWZkN2U3ZiAxMDA2NDQKPj4gLS0tIGEvYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmkuYwo+PiArKysg
Yi9hcmNoL3Jpc2N2L2t2bS92Y3B1X3NiaS5jCj4+IEBAIC01MDUsOCArNTA1LDM3IEBAIHZvaWQg
a3ZtX3Jpc2N2X3ZjcHVfc2JpX2luaXQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1KQo+PiAgCQkJY29u
dGludWU7Cj4+ICAJCX0KPj4gIAo+PiArCQlpZiAoIWV4dC0+ZGVmYXVsdF9kaXNhYmxlZCAmJiBl
eHQtPmluaXQgJiYKPj4gKwkJICAgIGV4dC0+aW5pdCh2Y3B1KSAhPSAwKSB7Cj4+ICsJCQlzY29u
dGV4dC0+ZXh0X3N0YXR1c1tpZHhdID0gS1ZNX1JJU0NWX1NCSV9FWFRfU1RBVFVTX1VOQVZBSUxB
QkxFOwo+PiArCQkJY29udGludWU7Cj4+ICsJCX0KPiAKPiBJIHRoaW5rIHRoaXMgbmV3IGJsb2Nr
IHNob3VsZCBiZSBiZWxvdyB0aGUgYXNzaWdubWVudCBiZWxvdyAoYW5kIGl0IGNhbgo+IGRyb3Ag
dGhlIGNvbnRpbnVlKSBhbmQgaXQgc2hvdWxkbid0IGNoZWNrIGRlZmF1bHRfZGlzYWJsZWQgKGFz
IEkndmUgZG9uZQo+IGJlbG93KS4gSU9XLCB3ZSBzaG91bGQgYWx3YXlzIHJ1biBleHQtPmluaXQg
d2hlbiB0aGVyZSBpcyBvbmUgdG8gcnVuIGhlcmUuCj4gT3RoZXJ3aXNlLCBJIGhvdyB3aWxsIGl0
IGdldCBydW4gbGF0ZXI/CgpPaywgaSBkaWQgbm90IHNhdyB0aGF0IHRoZXJlIHdhcyBhIHBvc3Np
YmlsaXR5IHRvIGVuYWJsZSB0aGUgZXh0ZW5zaW9uCmF0IGEgbGF0ZXIgdGltZS4gSSdsbCBmaXgg
dGhhdC4KClRoYW5rcywKCkNsw6ltZW50Cgo+IAo+PiArCj4+ICAJCXNjb250ZXh0LT5leHRfc3Rh
dHVzW2lkeF0gPSBleHQtPmRlZmF1bHRfZGlzYWJsZWQgPwo+PiAgCQkJCQlLVk1fUklTQ1ZfU0JJ
X0VYVF9TVEFUVVNfRElTQUJMRUQgOgo+PiAgCQkJCQlLVk1fUklTQ1ZfU0JJX0VYVF9TVEFUVVNf
RU5BQkxFRDsKPiAKPiAgICAgICAgICAgICAgICAgaWYgKGV4dC0+aW5pdCAmJiBleHQtPmluaXQo
dmNwdSkpCj4gICAgICAgICAgICAgICAgICAgICBzY29udGV4dC0+ZXh0X3N0YXR1c1tpZHhdID0g
S1ZNX1JJU0NWX1NCSV9FWFRfU1RBVFVTX1VOQVZBSUxBQkxFOwo+IAo+PiAgCX0KPj4gIH0KPj4g
Kwo+PiArdm9pZCBrdm1fcmlzY3ZfdmNwdV9zYmlfZGVpbml0KHN0cnVjdCBrdm1fdmNwdSAqdmNw
dSkKPj4gK3sKPj4gKwlzdHJ1Y3Qga3ZtX3ZjcHVfc2JpX2NvbnRleHQgKnNjb250ZXh0ID0gJnZj
cHUtPmFyY2guc2JpX2NvbnRleHQ7Cj4+ICsJY29uc3Qgc3RydWN0IGt2bV9yaXNjdl9zYmlfZXh0
ZW5zaW9uX2VudHJ5ICplbnRyeTsKPj4gKwljb25zdCBzdHJ1Y3Qga3ZtX3ZjcHVfc2JpX2V4dGVu
c2lvbiAqZXh0Owo+PiArCWludCBpZHgsIGk7Cj4+ICsKPj4gKwlmb3IgKGkgPSAwOyBpIDwgQVJS
QVlfU0laRShzYmlfZXh0KTsgaSsrKSB7Cj4+ICsJCWVudHJ5ID0gJnNiaV9leHRbaV07Cj4+ICsJ
CWV4dCA9IGVudHJ5LT5leHRfcHRyOwo+PiArCQlpZHggPSBlbnRyeS0+ZXh0X2lkeDsKPj4gKwo+
PiArCQlpZiAoaWR4IDwgMCB8fCBpZHggPj0gQVJSQVlfU0laRShzY29udGV4dC0+ZXh0X3N0YXR1
cykpCj4+ICsJCQljb250aW51ZTsKPj4gKwo+PiArCQlpZiAoc2NvbnRleHQtPmV4dF9zdGF0dXNb
aWR4XSA9PSBLVk1fUklTQ1ZfU0JJX0VYVF9TVEFUVVNfVU5BVkFJTEFCTEUgfHwKPj4gKwkJICAg
ICFleHQtPmRlaW5pdCkKPj4gKwkJCWNvbnRpbnVlOwo+PiArCj4+ICsJCWV4dC0+ZGVpbml0KHZj
cHUpOwo+PiArCX0KPj4gK30KPj4gLS0gCj4+IDIuNDcuMgo+Pgo+IAo+IFRoYW5rcywKPiBkcmV3
CgoKLS0gCmt2bS1yaXNjdiBtYWlsaW5nIGxpc3QKa3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9rdm0tcmlzY3YK
