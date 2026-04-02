Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B07BED39420
	for <kvm-riscv@archiver.kernel.org>; Thu,  2 Apr 2026 13:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=et7HQyEcYcVpW668kyQb3fzQz+eKgT1urrK+b/3lSw8=; b=wxxKNU4uLj2lXT
	c+dwYcinBRwKKsXkv/rIoTJF2qF+TkSj87vOqJfrpSm/G5UOFWSCS7iJbThdwdHr1XL/kQDVj6hTD
	nltjsY2RJhdEKRp2PqnF77D+3oA7L87UISmOgUB+rIHtGDlElTf6r0RoJEzc4PTZnWleNIeSsdjQE
	5mAhjlJ04+u2nj7HQPhqwriuVB5bCdjwoZ/o11jFJ539883f3cC1fFaxOp4qiHs6Sy3VGtGVV3iuA
	AXMBa/WA1DUnLw+NvwUHQsCG01i7R/5DHy1nmjWghRcfZeJvlnefhxLLD/2nraGp3HsxeP1KCOjW0
	ZunTcYdhAjLy+OEH78Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8I5s-00000000BHO-1cVX;
	Thu, 02 Apr 2026 13:28:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8I5q-00000000BGp-3gJU
	for kvm-riscv@bombadil.infradead.org;
	Thu, 02 Apr 2026 13:28:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Gwo7+tgUOrb+SJWwjSXGHYxxEG4gJRnUrJiDAJE/ZOA=; b=M2qz88FQbY6ITy9cztLn84kBMs
	rCoMNw1r7vvpNg7RsqssOWg6Ma9RqHwoLO8oO1gSpgAuZoisnVgkBxsmUEtZbamVPyH+Gl0RO9V+k
	VByuoVwuQt3QotTxUrgeZkSwBxvU7ffBRzO+NoRQfNrYvWiWOkKBUHC2it4CnH2H1FIy+qPmVVDcG
	K4OUwyic4FxNLuPC0PQ9j44hD3xBT1cv9kPlfdhfTuKg1Rnw9HqRfJUfrq5DGfEZyoiqmDH3raI4Q
	gY69e1f8JRDpbAQiOWhL4V7I/VFPJHgS5LIwerCpJmpAEP8RQ0Ce1gl2nER+UpQW/VLYgWRWjeMJ/
	pC+648wg==;
Received: from mail-oo1-xc2e.google.com ([2607:f8b0:4864:20::c2e])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8I5n-00000002XyD-3rwn
	for kvm-riscv@lists.infradead.org;
	Thu, 02 Apr 2026 13:28:17 +0000
Received: by mail-oo1-xc2e.google.com with SMTP id 006d021491bc7-67e23011c93so313839eaf.3
        for <kvm-riscv@lists.infradead.org>; Thu, 02 Apr 2026 06:28:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775136493; cv=none;
        d=google.com; s=arc-20240605;
        b=UKOMlO26uvkK9Uf1D+GInjEocGQUuVOkF90tbtjA63/9JR2PpxJAaIZRo85MH68sg1
         aFNPj2Mp1hf7PBHcGc3jUp7JBRbDcchmLeMb2zRIEekm/9WWiusdkBgGOLTovz8cvtGd
         5VUUanxKLrFLPFUb2vRXdpYRRp2dr4wb/jy9m68pc4Rs32d6Upr5siy/WH2yCLhJAZD7
         5AmVqltsmplo9DjkJCvbpm99eocVbM9dzaO0QM2g+umOYmfhZgU9WsCnPMQVWN7QgNvp
         2YvU/qsyBWk8N+qKU/XPeFki8mt3yqEi+m+MwuvOGp727Tp2fGBCzSkz3297zSAddPss
         IPHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Gwo7+tgUOrb+SJWwjSXGHYxxEG4gJRnUrJiDAJE/ZOA=;
        fh=q9sY/3vaOAJ/ueXy34EL8SD3uLZQ/I8ck2Nrkyio7UU=;
        b=M/27mrNFYZiEX5Wrq7Nv3N9O4qMUH2EWGVvIZhymOZX1DCMiUIhEMpDmBsK4BYRqAD
         ISw/k/KPHVJiBcbH3uSU+UfffPLSYvi4tC7qMPIz3KsU7MuDAGpau7EFZ7ouV7+1ehCX
         nwANsnCBK9eDif+UaUA4s+S269y8UbYLnLS5FFg0cMxU32P9SghsS4uuDqDRvoC6dvbL
         /0mTbYk29rlpV2B+DCKyHmEE6gv4ByRnGau11WlVuBJ4RhuzcWinP+8JXOq8ykq5DmWf
         Jsxf847ZwXljkvKvJFHRzO7KwcED+FQdQuO9HzXc+aLxsZ1p8svctZmrLsLl9p6yRyWX
         7zpg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1775136493; x=1775741293; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gwo7+tgUOrb+SJWwjSXGHYxxEG4gJRnUrJiDAJE/ZOA=;
        b=oZ1Db2sSJyoRxsZ9l1Bg+tb4H/5Oum+Dov0DjQMT68EiwavBHTMph4GGl5/yDDsn5C
         PABpLL2JCMc6qaWfVkol6cRZsVlIwstC8LaZwqdQSUFZUMKO6AWKbXeEAXR2tf4LtMoN
         IdC0Jj7fJr2zdDaR4YprZLxC+lQBx29vtoY8fmhLmGdOsovKgNqLYLhUNTB8K3/0PLqt
         lRcA6gp1/JJ4YPuteWlxi7z9cytr0EU0iRtw5+4+uOFCbpGKkvTlUokkQVUI42GXmUqt
         3rKUXdW2H/2x2AjLoBZJhZDf1L3FbmhRqkBG9vV9+FpfqjgzuldmGzXp7umkcgjuZPjp
         HjLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775136493; x=1775741293;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Gwo7+tgUOrb+SJWwjSXGHYxxEG4gJRnUrJiDAJE/ZOA=;
        b=fUF9/vDtW+Qgqeb/e6/KynGL68MgJZkGxzcbNjjwkn0mpQtmc3Ye2g8r2IADPU1Dkb
         g32fZdKoj6EpDFbUeeac+tf61Ayuj32p7HG84y+t7sElrW5zyFfE9iQSruK1nDVktMKb
         +Lvq9VfZgHJMMKxA0kedQsY1AGxaRMfNSP/BbYm7NhXAq9uiW/Ze087lsdmL8BwrNQX3
         njZMk/kc2u3ttY7L64r3A75DLRkHXfRILp6pt8+68xkNJwDMCxUtBqtCbVfMdqe8o4fH
         23/Gc3VbbKgPXPQB33yqz3Gc4GnmCLO+gh4ckW9AP22ZwQmxSwgCRwekvMhn8hIYWN97
         +eIA==
X-Forwarded-Encrypted: i=1; AJvYcCW58tgtn8WE1wCp3VG6KnUAslR2llzVEDE9Yrf5rSoTbglP953om4XGqRPu9p+g6Dh+cMO5KQKETqA=@lists.infradead.org
X-Gm-Message-State: AOJu0YzZIi0b4ELAxluAJkX5OFe4A95AlXc5WHNUEN+ThczTgi///Ye9
	seaoN4Q0R2/ovs03FS/WB8kgsHgJne94sxhaZYPRTX4vfwryddfzDGdSjqrPCTfIoasfWv0ntgL
	l0eWP1twPMwoNlB1yZE0Y5br7XqSRW3aJ1Kt3eC6tHQ==
X-Gm-Gg: ATEYQzyeU+pkvSxpmEX+SUk2gZlVrktbdbSr5DjqkMtWHOpK3CBQ8VPaXp0KNNfoDSm
	b1W1U61fItj6lR4Tdk0HxFPMO7qTWNMJxk1S0kKMiJQw0kACEWtRrwCJaY9V5BP7atzb6UDuD+j
	745IN0Rt5Ap5gb/h60FXS7sGHC66jp+UDnDUkXt2wWBidfgXsZn9H3SKsynaipnZkvrJf+0bNss
	03H+kEKC9jUdOu65J68LgU3dwnKGI5fQTPZgC5ucWHwRXNHaN6tcUV20I29qosswVC9QhRcEyRX
	vOQvsiStSXL7ugodp/HBZ4taIzCkgV4hemfw9CAFX10JMEBTpurgwGqnI/xsZ3rBsjWHZ/gHtDG
	vMhxFmydWmZUIAiiYfr8tke+6Mg==
X-Received: by 2002:a05:6820:2f01:b0:67f:ac08:d78b with SMTP id
 006d021491bc7-67fac08d9a1mr2937060eaf.25.1775136493375; Thu, 02 Apr 2026
 06:28:13 -0700 (PDT)
MIME-Version: 1.0
References: <20260227121008.442241-1-tjytimi@163.com>
In-Reply-To: <20260227121008.442241-1-tjytimi@163.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 2 Apr 2026 18:58:01 +0530
X-Gm-Features: AQROBzCdorpmHyQHBiu4oSiym1sKMdsAQ59SLSIP6DWXbg54kifkZBvpDdbltSk
Message-ID: <CAAhSdy0M6+1w0FbqzmpQ2gkv4sXgo9+WcbW-TB9mBLvD7=GXDw@mail.gmail.com>
Subject: Re: [PATCH v7] KVM: riscv: Skip CSR restore if VCPU is reloaded on
 the same core
To: Jinyu Tang <tjytimi@163.com>
Cc: =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <radim.krcmar@oss.qualcomm.com>, 
	Atish Patra <atish.patra@linux.dev>, Andrew Jones <andrew.jones@oss.qualcomm.com>, 
	Conor Dooley <conor.dooley@microchip.com>, Yong-Xuan Wang <yongxuan.wang@sifive.com>, 
	Nutty Liu <nutty.liu@hotmail.com>, Paul Walmsley <pjw@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_142816_194739_522BD230 
X-CRM114-Status: GOOD (  36.70  )
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

T24gRnJpLCBGZWIgMjcsIDIwMjYgYXQgNTo0MOKAr1BNIEppbnl1IFRhbmcgPHRqeXRpbWlAMTYz
LmNvbT4gd3JvdGU6Cj4KPiBDdXJyZW50bHksIGt2bV9hcmNoX3ZjcHVfbG9hZCgpIHVuY29uZGl0
aW9uYWxseSByZXN0b3JlcyBndWVzdCBDU1JzLAo+IEhHQVRQLCBhbmQgQUlBIHN0YXRlLiBIb3dl
dmVyLCB3aGVuIGEgVkNQVSBpcyBsb2FkZWQgYmFjayBvbiB0aGUgc2FtZQo+IHBoeXNpY2FsIENQ
VSwgYW5kIG5vIG90aGVyIEtWTSBWQ1BVIGhhcyBydW4gb24gdGhpcyBDUFUgc2luY2UgaXQgd2Fz
Cj4gbGFzdCBwdXQsIHRoZSBoYXJkd2FyZSBDU1JzIGFuZCBBSUEgcmVnaXN0ZXJzIGFyZSBzdGls
bCB2YWxpZC4KPgo+IFRoaXMgcGF0Y2ggb3B0aW1pemVzIHRoZSB2Y3B1X2xvYWQgcGF0aCBieSBz
a2lwcGluZyB0aGUgZXhwZW5zaXZlIENTUgo+IGFuZCBBSUEgd3JpdGVzIGlmIGFsbCB0aGUgZm9s
bG93aW5nIGNvbmRpdGlvbnMgYXJlIG1ldDoKPiAxLiBJdCBpcyBiZWluZyByZWxvYWRlZCBvbiB0
aGUgc2FtZSBDUFUgKHZjcHUtPmFyY2gubGFzdF9leGl0X2NwdSA9PSBjcHUpLgo+IDIuIFRoZSBD
U1JzIGFyZSBub3QgZGlydHkgKCF2Y3B1LT5hcmNoLmNzcl9kaXJ0eSkuCj4gMy4gTm8gb3RoZXIg
VkNQVSB1c2VkIHRoaXMgQ1BVICh2Y3B1ID09IF9fdGhpc19jcHVfcmVhZChrdm1fZm9ybWVyX3Zj
cHUpKS4KPgo+IFRvIGVuc3VyZSB0aGlzIGZhc3QtcGF0aCBkb2Vzbid0IGJyZWFrIGNvcm5lciBj
YXNlczoKPiAtIExpdmUgbWlncmF0aW9uIGFuZCBWQ1BVIHJlc2V0IGFyZSBuYXR1cmFsbHkgc2Fm
ZS4gS1ZNIGluaXRpYWxpemVzCj4gICBsYXN0X2V4aXRfY3B1IHRvIC0xLCB3aGljaCBndWFyYW50
ZWVzIHRoZSBmYXN0LXBhdGggd29uJ3QgdHJpZ2dlci4KPiAtIFRoZSAnY3NyX2RpcnR5JyBmbGFn
IHRyYWNrcyBydW50aW1lIHVzZXJzcGFjZSBpbnRlcnZlbnRpb25zLiBJZgo+ICAgdXNlcnNwYWNl
IG1vZGlmaWVzIGd1ZXN0IGNvbmZpZ3VyYXRpb25zIChlLmcuLCBoZWRlbGVnIHZpYQo+ICAgS1ZN
X1NFVF9HVUVTVF9ERUJVRywgb3IgQ1NScyBpbmNsdWRpbmcgQUlBIHZpYSBLVk1fU0VUX09ORV9S
RUcpLAo+ICAgdGhlIGZsYWcgaXMgc2V0IHRvIHNraXAgdGhlIGZhc3QgcGF0aC4KPgo+IFdpdGgg
dGhlICdjc3JfZGlydHknIHNhZmVndWFyZCBwcm92ZW4gZWZmZWN0aXZlLCBpdCBpcyBzYWZlIHRv
Cj4gaW5jbHVkZSBrdm1fcmlzY3ZfdmNwdV9haWFfbG9hZCgpIGluc2lkZSB0aGUgc2tpcCBsb2dp
YyBub3cuCj4KPiBTaWduZWQtb2ZmLWJ5OiBKaW55dSBUYW5nIDx0anl0aW1pQDE2My5jb20+CgpR
dWV1ZWQgdGhpcyBwYXRjaCBmb3IgTGludXgtNy4xCgpUaGFua3MsCkFudXAKCj4gLS0tCj4gIHY2
IC0+IHY3Ogo+ICAtIE1vdmVkIGt2bV9yaXNjdl92Y3B1X2FpYV9sb2FkKCkgaW50byB0aGUgZmFz
dC1wYXRoIHNraXAgbG9naWMsIGFzCj4gICAgc3VnZ2VzdGVkIGJ5IFJhZGltIEtyxI1tw6HFmS4K
PiAgLSBWZXJpZmllZCB0aGUgZml4IGZvciB0aGUgSU1TSUMgaW5zdGFiaWxpdHkgaXNzdWUgcmVw
b3J0ZWQgaW4gdjMuCj4gICAgVGVzdGluZyB3YXMgY29uZHVjdGVkIG9uIFFFTVUgMTAuMC4yIHdp
dGggZXhwbGljaXRseSBlbmFibGVkIEFJQQo+ICAgIChgLW1hY2hpbmUgdmlydCxhaWE9YXBsaWMt
aW1zaWNgKS4gVGhlIGd1ZXN0IGJvb3RzIHN1Y2Nlc3NmdWxseQo+ICAgIHVzaW5nIHZpcnRpby1t
bWlvIGRldmljZXMgbGlrZSB2aXJ0aW8tYmxrIGFuZCB2aXJ0aW8tbmV0Lgo+Cj4gIHY1IC0+IHY2
Ogo+ICBBcyBzdWdnZXN0ZWQgYnkgQW5kcmV3IEpvbmVzLCBjaGVja2luZyAnbGFzdF9leGl0X2Nw
dScgZmlyc3QgKG1vc3QKPiAgbGlrZWx5IHRvIGZhaWwgb24gYnVzeSBob3N0cykgYW5kIHBsYWNp
bmcgdGhlIGV4cGVuc2l2ZQo+ICBfX3RoaXNfY3B1X3JlYWQoKSBsYXN0LCBza2lwcGluZyBfX3Ro
aXNfY3B1X3dyaXRlKCkgaW4ga3ZtX2FyY2hfdmNwdV9wdXQoKQo+ICBpZiBrdm1fZm9ybWVyX3Zj
cHUgaXMgYWxyZWFkeSBzZXQgdG8gdGhlIGN1cnJlbnQgVkNQVS4KPgo+ICB2NCAtPiB2NToKPiAg
LSBEcm9wcGVkIHRoZSAndmNwdS0+c2NoZWR1bGVkX291dCcgY2hlY2sgYXMgQW5kcmV3IEpvbmVz
IHBvaW50ZWQgb3V0LAo+ICAgIHJlbHlpbmcgb24gJ2xhc3RfZXhpdF9jcHUnLCAnZm9ybWVyX3Zj
cHUnLCBhbmQgJyFjc3JfZGlydHknCj4gICAgaXMgc3VmZmljaWVudCBhbmQgc2FmZS4gVGhpcyBl
eHBhbmRzIHRoZSBvcHRpbWl6YXRpb24gdG8gY292ZXIgbWFueQo+ICAgIHVzZXJzcGFjZSBleGl0
cyAoZS5nLiwgTU1JTykgYXMgd2VsbC4KPiAgLSBBZGRlZCBhIGJsb2NrIGNvbW1lbnQgaW4ga3Zt
X2FyY2hfdmNwdV9sb2FkKCkgdG8gd2FybiBmdXR1cmUKPiAgICBkZXZlbG9wZXJzIGFib3V0IG1h
aW50YWluaW5nIHRoZSAnY3NyX2RpcnR5JyBkZXBlbmRlbmN5LCBhcyBBbmRyZXcncwo+ICAgIHN1
Z2dlc3Rpb24gdG8gcmVkdWNlIGZyYWdpbGl0eS4KPiAgLSBSZW1vdmVkIHVubmVjZXNzYXJ5IHNp
bmdsZS1saW5lIGNvbW1lbnRzIGFuZCBmaXhlZCBpbmRlbnRhdGlvbiBuaXRzLgo+Cj4gIHYzIC0+
IHY0Ogo+ICAtIEFkZHJlc3NlZCBBbnVwIFBhdGVsJ3MgcmV2aWV3IHJlZ2FyZGluZyBoYXJkd2Fy
ZSBzdGF0ZSBpbmNvbnNpc3RlbmN5Lgo+ICAtIEludHJvZHVjZWQgJ2Nzcl9kaXJ0eScgZmxhZyB0
byB0cmFjayBkeW5hbWljIHVzZXJzcGFjZSBDU1IvQ09ORklHCj4gICAgbW9kaWZpY2F0aW9ucyAo
S1ZNX1NFVF9PTkVfUkVHLCBLVk1fU0VUX0dVRVNUX0RFQlVHKSwgZm9yY2luZyBhIGZ1bGwKPiAg
ICByZXN0b3JlIHdoZW4gZGVidWdnaW5nIG9yIG1vZGlmeWluZyBzdGF0ZXMgYXQgdXNlcnNwYWNl
Lgo+ICAtIEtlcHQga3ZtX3Jpc2N2X3ZjcHVfYWlhX2xvYWQoKSBvdXQgb2YgdGhlIHNraXAgYmxv
Y2sgdG8gcmVzb2x2ZSBJTVNJQwo+ICAgIFZTLWZpbGUgaW5zdGFiaWxpdHkuCj4KPiAgdjIgLT4g
djM6Cj4gIHYyIHdhcyBtaXNzaW5nIGEgY3JpdGljYWwgY2hlY2sgYmVjYXVzZSBJIGdlbmVyYXRl
ZCB0aGUgcGF0Y2ggZnJvbSBteQo+ICB3cm9uZyAoZXhwZXJpbWVudGFsKSBicmFuY2guIFRoaXMg
aXMgZml4ZWQgaW4gdjMuIFNvcnJ5IGZvciBteSB0cm91YmxlLgo+Cj4gIHYxIC0+IHYyOgo+ICBB
cHBseSB0aGUgbG9naWMgdG8gYWlhIGNzciBsb2FkLiBUaGFua3MgZm9yIEFuZHJldyBKb25lcydz
IGFkdmljZS4KPiAtLS0KPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1faG9zdC5oIHwgIDMg
KysrCj4gIGFyY2gvcmlzY3Yva3ZtL3ZjcHUuYyAgICAgICAgICAgICB8IDI0ICsrKysrKysrKysr
KysrKysrKysrKystLQo+ICBhcmNoL3Jpc2N2L2t2bS92Y3B1X29uZXJlZy5jICAgICAgfCAgMiAr
Kwo+ICAzIGZpbGVzIGNoYW5nZWQsIDI3IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4K
PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1faG9zdC5oIGIvYXJjaC9y
aXNjdi9pbmNsdWRlL2FzbS9rdm1faG9zdC5oCj4gaW5kZXggMjQ1ODUzMDRjLi43ZWU0N2I4M2Mg
MTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1faG9zdC5oCj4gKysrIGIv
YXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1faG9zdC5oCj4gQEAgLTI3Myw2ICsyNzMsOSBAQCBz
dHJ1Y3Qga3ZtX3ZjcHVfYXJjaCB7Cj4gICAgICAgICAvKiAnc3RhdGljJyBjb25maWd1cmF0aW9u
cyB3aGljaCBhcmUgc2V0IG9ubHkgb25jZSAqLwo+ICAgICAgICAgc3RydWN0IGt2bV92Y3B1X2Nv
bmZpZyBjZmc7Cj4KPiArICAgICAgIC8qIEluZGljYXRlcyBtb2RpZmllZCBndWVzdCBDU1JzICov
Cj4gKyAgICAgICBib29sIGNzcl9kaXJ0eTsKPiArCj4gICAgICAgICAvKiBTQkkgc3RlYWwtdGlt
ZSBhY2NvdW50aW5nICovCj4gICAgICAgICBzdHJ1Y3Qgewo+ICAgICAgICAgICAgICAgICBncGFf
dCBzaG1lbTsKPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rdm0vdmNwdS5jIGIvYXJjaC9yaXNj
di9rdm0vdmNwdS5jCj4gaW5kZXggYTU1YTk1ZGE1Li4yZTRkZmZmMDcgMTAwNjQ0Cj4gLS0tIGEv
YXJjaC9yaXNjdi9rdm0vdmNwdS5jCj4gKysrIGIvYXJjaC9yaXNjdi9rdm0vdmNwdS5jCj4gQEAg
LTI0LDYgKzI0LDggQEAKPiAgI2RlZmluZSBDUkVBVEVfVFJBQ0VfUE9JTlRTCj4gICNpbmNsdWRl
ICJ0cmFjZS5oIgo+Cj4gK3N0YXRpYyBERUZJTkVfUEVSX0NQVShzdHJ1Y3Qga3ZtX3ZjcHUgKiwg
a3ZtX2Zvcm1lcl92Y3B1KTsKPiArCj4gIGNvbnN0IHN0cnVjdCBfa3ZtX3N0YXRzX2Rlc2Mga3Zt
X3ZjcHVfc3RhdHNfZGVzY1tdID0gewo+ICAgICAgICAgS1ZNX0dFTkVSSUNfVkNQVV9TVEFUUygp
LAo+ICAgICAgICAgU1RBVFNfREVTQ19DT1VOVEVSKFZDUFUsIGVjYWxsX2V4aXRfc3RhdCksCj4g
QEAgLTUzNyw2ICs1MzksOCBAQCBpbnQga3ZtX2FyY2hfdmNwdV9pb2N0bF9zZXRfZ3Vlc3RfZGVi
dWcoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LAo+ICAgICAgICAgICAgICAgICB2Y3B1LT5hcmNoLmNm
Zy5oZWRlbGVnIHw9IEJJVChFWENfQlJFQUtQT0lOVCk7Cj4gICAgICAgICB9Cj4KPiArICAgICAg
IHZjcHUtPmFyY2guY3NyX2RpcnR5ID0gdHJ1ZTsKPiArCj4gICAgICAgICByZXR1cm4gMDsKPiAg
fQo+Cj4gQEAgLTU4MSw2ICs1ODUsMjEgQEAgdm9pZCBrdm1fYXJjaF92Y3B1X2xvYWQoc3RydWN0
IGt2bV92Y3B1ICp2Y3B1LCBpbnQgY3B1KQo+ICAgICAgICAgc3RydWN0IGt2bV92Y3B1X2NzciAq
Y3NyID0gJnZjcHUtPmFyY2guZ3Vlc3RfY3NyOwo+ICAgICAgICAgc3RydWN0IGt2bV92Y3B1X2Nv
bmZpZyAqY2ZnID0gJnZjcHUtPmFyY2guY2ZnOwo+Cj4gKyAgICAgICAvKgo+ICsgICAgICAgICog
SWYgVkNQVSBpcyBiZWluZyByZWxvYWRlZCBvbiB0aGUgc2FtZSBwaHlzaWNhbCBDUFUgYW5kIG5v
Cj4gKyAgICAgICAgKiBvdGhlciBLVk0gVkNQVSBoYXMgcnVuIG9uIHRoaXMgQ1BVIHNpbmNlIGl0
IHdhcyBsYXN0IHB1dCwKPiArICAgICAgICAqIHdlIGNhbiBza2lwIHRoZSBleHBlbnNpdmUgQ1NS
IGFuZCBIR0FUUCB3cml0ZXMuCj4gKyAgICAgICAgKgo+ICsgICAgICAgICogTm90ZTogSWYgYSBu
ZXcgQ1NSIGlzIGFkZGVkIHRvIHRoaXMgZmFzdC1wYXRoIHNraXAgYmxvY2ssCj4gKyAgICAgICAg
KiBtYWtlIHN1cmUgdGhhdCAnY3NyX2RpcnR5JyBpcyBzZXQgdG8gdHJ1ZSBpbiBhbnkKPiArICAg
ICAgICAqIGlvY3RsIChlLmcuLCBLVk1fU0VUX09ORV9SRUcpIHRoYXQgbW9kaWZpZXMgaXQuCj4g
KyAgICAgICAgKi8KPiArICAgICAgIGlmICh2Y3B1ICE9IF9fdGhpc19jcHVfcmVhZChrdm1fZm9y
bWVyX3ZjcHUpKQo+ICsgICAgICAgICAgICAgICBfX3RoaXNfY3B1X3dyaXRlKGt2bV9mb3JtZXJf
dmNwdSwgdmNwdSk7Cj4gKyAgICAgICBlbHNlIGlmICh2Y3B1LT5hcmNoLmxhc3RfZXhpdF9jcHUg
PT0gY3B1ICYmICF2Y3B1LT5hcmNoLmNzcl9kaXJ0eSkKPiArICAgICAgICAgICAgICAgZ290byBj
c3JfcmVzdG9yZV9kb25lOwo+ICsKPiArICAgICAgIHZjcHUtPmFyY2guY3NyX2RpcnR5ID0gZmFs
c2U7Cj4gICAgICAgICBpZiAoa3ZtX3Jpc2N2X25hY2xfc3luY19jc3JfYXZhaWxhYmxlKCkpIHsK
PiAgICAgICAgICAgICAgICAgbnNoID0gbmFjbF9zaG1lbSgpOwo+ICAgICAgICAgICAgICAgICBu
YWNsX2Nzcl93cml0ZShuc2gsIENTUl9WU1NUQVRVUywgY3NyLT52c3N0YXR1cyk7Cj4gQEAgLTYy
NCw2ICs2NDMsOSBAQCB2b2lkIGt2bV9hcmNoX3ZjcHVfbG9hZChzdHJ1Y3Qga3ZtX3ZjcHUgKnZj
cHUsIGludCBjcHUpCj4KPiAgICAgICAgIGt2bV9yaXNjdl9tbXVfdXBkYXRlX2hnYXRwKHZjcHUp
Owo+Cj4gKyAgICAgICBrdm1fcmlzY3ZfdmNwdV9haWFfbG9hZCh2Y3B1LCBjcHUpOwo+ICsKPiAr
Y3NyX3Jlc3RvcmVfZG9uZToKPiAgICAgICAgIGt2bV9yaXNjdl92Y3B1X3RpbWVyX3Jlc3RvcmUo
dmNwdSk7Cj4KPiAgICAgICAgIGt2bV9yaXNjdl92Y3B1X2hvc3RfZnBfc2F2ZSgmdmNwdS0+YXJj
aC5ob3N0X2NvbnRleHQpOwo+IEBAIC02MzMsOCArNjU1LDYgQEAgdm9pZCBrdm1fYXJjaF92Y3B1
X2xvYWQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCBpbnQgY3B1KQo+ICAgICAgICAga3ZtX3Jpc2N2
X3ZjcHVfZ3Vlc3RfdmVjdG9yX3Jlc3RvcmUoJnZjcHUtPmFyY2guZ3Vlc3RfY29udGV4dCwKPiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHZjcHUtPmFyY2guaXNh
KTsKPgo+IC0gICAgICAga3ZtX3Jpc2N2X3ZjcHVfYWlhX2xvYWQodmNwdSwgY3B1KTsKPiAtCj4g
ICAgICAgICBrdm1fbWFrZV9yZXF1ZXN0KEtWTV9SRVFfU1RFQUxfVVBEQVRFLCB2Y3B1KTsKPgo+
ICAgICAgICAgdmNwdS0+Y3B1ID0gY3B1Owo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2t2bS92
Y3B1X29uZXJlZy5jIGIvYXJjaC9yaXNjdi9rdm0vdmNwdV9vbmVyZWcuYwo+IGluZGV4IGU3YWI2
Y2IwMC4uZmMwOGJmODMzIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfb25lcmVn
LmMKPiArKysgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1X29uZXJlZy5jCj4gQEAgLTY1Miw2ICs2NTIs
OCBAQCBzdGF0aWMgaW50IGt2bV9yaXNjdl92Y3B1X3NldF9yZWdfY3NyKHN0cnVjdCBrdm1fdmNw
dSAqdmNwdSwKPiAgICAgICAgIGlmIChyYykKPiAgICAgICAgICAgICAgICAgcmV0dXJuIHJjOwo+
Cj4gKyAgICAgICB2Y3B1LT5hcmNoLmNzcl9kaXJ0eSA9IHRydWU7Cj4gKwo+ICAgICAgICAgcmV0
dXJuIDA7Cj4gIH0KPgo+IC0tCj4gMi40My4wCj4KCi0tIAprdm0tcmlzY3YgbWFpbGluZyBsaXN0
Cmt2bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2Cg==
