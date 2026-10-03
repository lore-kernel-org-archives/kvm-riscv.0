Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 141F4CA5FE3
	for <kvm-riscv@archiver.kernel.org>; Sat,  3 Oct 2026 10:02:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IJ+ZnsNgw9xOU+lEplgw5F0jso06gvCSDLlBxvAWk6A=; b=nxhuH50/95vVDo
	riHGV6SDN3cwZ4yjoBeJ9ezcrfByXL2DooaVLhI4PXrkSEGG+73Mv0cLQB5xzpOo0uQQqLc2faQky
	96WqFUw3zLRalm/afmazdkqC+XoFRwipI65QqemNnn57JLDhPJ5l7ASClJKlebyjW5OFPV1EM8VgS
	ngqYHvuw7KHvFPrQ1g94lRVjyEzh3w6+167ZA2RWLWGqJx86ziP1pzXREiiFiSt5Wqb9Le+3zBKRG
	BkZhPFhhyPRzZknsL+7waFgavt4EThrKxj2XFYHHDmh8reInTZHx+ZVa7AizIPauY39YRdIsuc8R+
	t4Dd564wAkSA/vyo06AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCwZE-0000000DKkg-3HiH;
	Sat, 03 Oct 2026 10:02:08 +0000
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCwZB-0000000DKiI-2qK3
	for kvm-riscv@lists.infradead.org;
	Sat, 03 Oct 2026 10:02:07 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-482f6350f91so93403f8f.1
        for <kvm-riscv@lists.infradead.org>; Sat, 03 Oct 2026 03:02:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791021724; cv=none;
        d=google.com; s=arc-20260327;
        b=LyvO6Fr5WiCd4piF/RHFAv+3bRLNe0/+OyoufzBXxHuPgUZJQm74E6Kmy6Nl6jA2pY
         ZLQJ09JvCdfPIE1HMNditiNcfeCfxyc3gYBtr2pEExnozepwg8kb9pNpMhwygiHwc7A8
         1MMmk4WNi6vdwWtfimCW2NcCBvcgmDujOicYiGhgO71Mubt+Tk8/d5StXdzuNsd+Wsgp
         qP27+2aiLOha1pZa8EcIjEiEC6C/dPnLhmJCwEsK6mXlF6ImHSHCtUep2e1liaitVcX7
         /sc39mwCPunQWej95l59dWiTRhbCOZi/gmMfa1FoT+jORsvgzLNZ2EJkVuB3PjMnYosS
         +r9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MP8Sqa2CEbzPapCdfasmIP+eBvUM/xKkRDsl2sHLpvE=;
        fh=tJq/R9f69kqGW3XdIB3g59wLfslL8RYj5N4ZflxPElo=;
        b=r4eNRfk2Lq+JTJIJKsH0Odvcb8tD1851h4rtRbz8YpQd94kJrCUZyxXKxEUo8PgMuG
         sapak7EazKPhSkhmHyksxNbvZywpN+pfSdao1u4E2L7MD1/+dbcw6S0d/b7RwlO2vgMA
         UYLnL+wJddlu3ZqwPI79OXnILjU7eWt8+bfjgRKm6+VGsXGXlSuFWdibi3gFVGBNhOM2
         AzzKuPj6b8NwqGWIANnGZwtDpZsHDYrVxPxawsOI1pQtsSzB7ngWJgwhvX2IVbYxTLuY
         1DAR475sCuh+j49J5l2zytxFM8H4q0yZppQwxX3HeyEcwjDN/m9dJdrxNf68CT1FJ8L8
         xoMQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1791021724; x=1791626524; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MP8Sqa2CEbzPapCdfasmIP+eBvUM/xKkRDsl2sHLpvE=;
        b=cJsVVMQ8YhPXotxy1FMZdrICrk45lPoEGKt6SF8vbQMyp7nFqRJLKaicSpsyBtMEub
         dzkADMXTmTCVFYaZZVocBpT3iF75R5zsAWyXzq3vGazPoLIS/8DcWWDBRLn7JlSLBPrq
         ZngRCMqswD70cK9LkeNRjyb98nIud/0t22L2jzm3mWJJGAJS9rQho9O7QMa4HrT3uohv
         vGuQ/jPUBkjDZcUTf99YmO2e2p1wQXcnSC5SK7u5BHu43UUOXpz7n5XlUQDxxJVdfMHX
         vj1J1oWvWVbf/e8iBSIpZ3i66Gi8HmsIOBziiKXXAcx1WFEf7G22764JQcgs7m9l54oX
         9rpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791021724; x=1791626524;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MP8Sqa2CEbzPapCdfasmIP+eBvUM/xKkRDsl2sHLpvE=;
        b=drcNTRNHlPC5XrWnHNmaSP4pWphi+UJSMhUM5JVlycCwze6A8umyZJiplPet8Shct0
         oVD6H66hWYE1letnNtIub9zvYh5y8fT0tZ4BOKNE1YP4wyMUsosotr3I+O3fGE0KryGc
         GwO0JTF2IUFuc5COI45m8ln4PMrY1i4DO1Pq+iM3Ep0tN3xy9xV81XB/tm+TMM3fXi29
         17pj2D0CfgthtK4eUabIiz4uSsPl36fBZ3mR3CTmr/ENIGuvRP2IwTayPCErSNCmgxaz
         cFWz/HBEWMqsAPDnb1gmkwaIbyXeYnX5W6/DljKMVn910rDKXu5qmFmHx3qMWNvD4tNx
         jFIg==
X-Forwarded-Encrypted: i=1; AKwUvByXTTIpV2f9Hg9fJHIe744vNa9bMbe3wYxp41uHFKLxo0PulmhYsRz7fj5jW7dQqmNRMhLjestk0yw=@lists.infradead.org
X-Gm-Message-State: AFq9FYL/sqQVNpVFajycBlmHPnEppVKM769fMUaSX9yBsgKG+EZC3zEn
	yzrT5xmbRCPSyUr/NUIiZFYRjDojB+A49LngNsLHHy+bDJwnnJu3Q2+rEHZTlP3ZU/Lh9VnmkI7
	PPYL5Ks0bdqCwvslABPWDiGFcnGi7+SMu+gpQsU+7QQ==
X-Gm-Gg: AYBFou0xVEC6/4pEW+wvzHdTypwVq46rbxtXc2Fs6gwr/4yAXRRSityDxsbruPznHGO
	V+UENoBOhoARMWYqXn9KAKHGB1ENGUL9TC3yRMd1PH/0wA19lHAMTMYS719NWOj7e6iTU+M6YGu
	rG2poZVeK7CT4oql8Wod457uDj7Cxdps+RV7SoEpuPoacUVq2j4tah+uhSrayXUh6LaHQ+J1guZ
	Kr9XWf/jo+oPQZKIbthvVHhkJzEBEiO+cnsZiQF3WmwCCq8vIvAI4UKCKrwkX25HyjXEOUjt5sj
	Rpm6FKvehWyPF2+PqteHgHYz739jzUGHARZkGFyFegSV6tjtyopcFeznnIhvYTE3HMGb5E7pY7b
	J0pUQb52peEsxd6bCHvaS7w6JQOCohKpiQEldOJcON24ra8rgfin+25k54uxjuaeEb4j1b2VIZZ
	I=
X-Received: by 2002:a05:6000:1846:b0:48b:1bf:ffb1 with SMTP id
 ffacd0b85a97d-48b12775c61mr10366149f8f.54.1791021723743; Sat, 03 Oct 2026
 03:02:03 -0700 (PDT)
MIME-Version: 1.0
References: <20260814114507.583424-1-jinyu.tang@linux.dev> <20260814114507.583424-4-jinyu.tang@linux.dev>
In-Reply-To: <20260814114507.583424-4-jinyu.tang@linux.dev>
From: Anup Patel <anup@brainfault.org>
Date: Sat, 3 Oct 2026 15:31:52 +0530
X-Gm-Features: AclHuK-r6E6EOJLR4dsLSLuGmbe9Jaf0ZQFpEhYpdE-Qre9_eJHe2jf_2nwa2RI
Message-ID: <CAAhSdy3D+4Oh9mD+MFP8RwoeTDB855ZQoGRgjEnYJQwRH4K4=g@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] KVM: selftests: Enable pre_fault_memory_test for RISC-V
To: Jinyu Tang <jinyu.tang@linux.dev>
Cc: Anup Patel <apatel@ventanamicro.com>, Sean Christopherson <seanjc@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Atish Patra <atish.patra@linux.dev>, Paul Walmsley <pjw@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Andrew Jones <andrew.jones@oss.qualcomm.com>, Conor Dooley <conor.dooley@microchip.com>, 
	Yong-Xuan Wang <yongxuan.wang@sifive.com>, Nutty Liu <nutty.liu@hotmail.com>, 
	Jinyu Tang <tjytimi@163.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261003_030206_286277_0E477752 
X-CRM114-Status: GOOD (  13.98  )
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

T24gRnJpLCBBdWcgMTQsIDIwMjYgYXQgNToxNuKAr1BNIEppbnl1IFRhbmcgPGppbnl1LnRhbmdA
bGludXguZGV2PiB3cm90ZToKPgo+IFJJU0MtViBub3cgc3VwcG9ydHMgS1ZNX1BSRV9GQVVMVF9N
RU1PUlksIHNvIGluY2x1ZGUgdGhlIGdlbmVyaWMKPiBwcmVfZmF1bHRfbWVtb3J5X3Rlc3QgaW4g
dGhlIFJJU0MtViBLVk0gc2VsZnRlc3QgYnVpbGQuCj4KPiBUaGUgdGVzdCB1c2VzIFBBR0VfU0la
RSBmcm9tIHRoZSBhcmNoaXRlY3R1cmUgcHJvY2Vzc29yIGhlYWRlci4gRGVmaW5lCj4gdGhlIG5v
cm1hbCA0SyBSSVNDLVYgc2VsZnRlc3QgcGFnZSBzaXplIHNvIHRoZSBnZW5lcmljIHRlc3QgY2Fu
IGJ1aWxkCj4gZm9yIFJJU0MtVi4KPgo+IFJldmlld2VkLWJ5OiBOdXR0eSBMaXUgPG51dHR5Lmxp
dUBob3RtYWlsLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBKaW55dSBUYW5nIDxqaW55dS50YW5nQGxp
bnV4LmRldj4KCkxHVE0uCgpSZXZpZXdlZC1ieTogQW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0
Lm9yZz4KClF1ZXVlZCB0aGlzIHBhdGNoIGZvciBMaW51eC03LjQKClRoYW5rcywKQW51cAoKCj4g
LS0tCj4gdjEgLT4gdjI6Cj4gLSBEcm9wIHRoZSBwZXItdGVzdCBndWVzdF9tb2Rlc19hcHBlbmRf
ZGVmYXVsdCgpIGNhbGwgZnJvbQo+ICAgcHJlX2ZhdWx0X21lbW9yeV90ZXN0LmMuICBSSVNDLVYg
YWxyZWFkeSBpbml0aWFsaXplcyBzdXBwb3J0ZWQgYW5kCj4gICBkZWZhdWx0IGd1ZXN0IG1vZGVz
IGZyb20ga3ZtX3NlbGZ0ZXN0X2FyY2hfaW5pdCgpLCB3aGljaCBpcyBjYWxsZWQgYnkKPiAgIHRo
ZSBjb21tb24ga3ZtX3NlbGZ0ZXN0X2luaXQoKSBjb25zdHJ1Y3RvciwgYXMgc3VnZ2VzdGVkIGJ5
IFNlYW4uCj4KPiAgdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL01ha2VmaWxlLmt2bSAgICAg
ICAgICAgICAgfCAxICsKPiAgdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL2luY2x1ZGUvcmlz
Y3YvcHJvY2Vzc29yLmggfCAzICsrKwo+ICAyIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygr
KQo+Cj4gZGlmZiAtLWdpdCBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9NYWtlZmlsZS5r
dm0gYi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0vTWFrZWZpbGUua3ZtCj4gaW5kZXggNmZj
MzRlOWJmOGUxLi5hYzY0YWM5MmZkNGIgMTAwNjQ0Cj4gLS0tIGEvdG9vbHMvdGVzdGluZy9zZWxm
dGVzdHMva3ZtL01ha2VmaWxlLmt2bQo+ICsrKyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2
bS9NYWtlZmlsZS5rdm0KPiBAQCAtMjI1LDYgKzIyNSw3IEBAIFRFU1RfR0VOX1BST0dTX3Jpc2N2
ICs9IGNvYWxlc2NlZF9pb190ZXN0Cj4gIFRFU1RfR0VOX1BST0dTX3Jpc2N2ICs9IGRpcnR5X2xv
Z19wZXJmX3Rlc3QKPiAgVEVTVF9HRU5fUFJPR1NfcmlzY3YgKz0gZ2V0LXJlZy1saXN0Cj4gIFRF
U1RfR0VOX1BST0dTX3Jpc2N2ICs9IG1tdV9zdHJlc3NfdGVzdAo+ICtURVNUX0dFTl9QUk9HU19y
aXNjdiArPSBwcmVfZmF1bHRfbWVtb3J5X3Rlc3QKPiAgVEVTVF9HRU5fUFJPR1NfcmlzY3YgKz0g
cnNlcV90ZXN0Cj4gIFRFU1RfR0VOX1BST0dTX3Jpc2N2ICs9IHN0ZWFsX3RpbWUKPgo+IGRpZmYg
LS1naXQgYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0vaW5jbHVkZS9yaXNjdi9wcm9jZXNz
b3IuaCBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9pbmNsdWRlL3Jpc2N2L3Byb2Nlc3Nv
ci5oCj4gaW5kZXggYWJkZTNjNzFjODkxLi43MDQ4N2M4ZWQxNTUgMTAwNjQ0Cj4gLS0tIGEvdG9v
bHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL2luY2x1ZGUvcmlzY3YvcHJvY2Vzc29yLmgKPiArKysg
Yi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0vaW5jbHVkZS9yaXNjdi9wcm9jZXNzb3IuaAo+
IEBAIC0xMiw2ICsxMiw5IEBACj4gICNpbmNsdWRlIDxhc20vdmRzby9wcm9jZXNzb3IuaD4KPiAg
I2luY2x1ZGUgImt2bV91dGlsLmgiCj4KPiArI2RlZmluZSBQQUdFX1NISUZUICAgICAgICAgICAg
IDEyCj4gKyNkZWZpbmUgUEFHRV9TSVpFICAgICAgICAgICAgICBCSVRfVUxMKFBBR0VfU0hJRlQp
Cj4gKwo+ICAjZGVmaW5lIElOU05fT1BDT0RFX01BU0sgICAgICAgMHgwMDdjCj4gICNkZWZpbmUg
SU5TTl9PUENPREVfU0hJRlQgICAgICAyCj4gICNkZWZpbmUgSU5TTl9PUENPREVfU1lTVEVNICAg
ICAyOAo+IC0tCj4gMi40My4wCgotLSAKa3ZtLXJpc2N2IG1haWxpbmcgbGlzdAprdm0tcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2t2bS1yaXNjdgo=
