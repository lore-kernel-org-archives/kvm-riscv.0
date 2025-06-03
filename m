Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBAEDC5AE59
	for <kvm-riscv@archiver.kernel.org>; Tue,  3 Jun 2025 11:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:Cc:Subject:
	From:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5Qd+HqJe+VRfnynLUGIpm7wuawS/kPUD7ron0/wczFw=; b=dA6HDuGnf8JOJ2
	b+hbqCbEE75iMgmtJiGodZ+aSCysgYzckkkS1K0VRv/496Kq/ZGEl26vgpdbQcjLwmOofuPMU/MRk
	r4V8i69PceViwPBR/yh7kd4B0inkWwLNirtXjB13siHWuKqX6gPPV1lI17f3v6uoRU+jMwYkLKjpw
	6FNSvk2jYDLOmklBw1TieNjroQYbwNBA4+R7cmfmfh9pl4xclV7aglA3wfmnwkbYiW0dQgtdlhsV1
	MfQ3x+YXZIHiepjFcJvc+hOu+Kh/0rZIt1WycIpk1+iQDCnUWt1j35PfWI19CksUoxxVkYgbjvlEC
	mtylPDOA7InHszUkUn1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMQ0R-0000000AoYL-12zP;
	Tue, 03 Jun 2025 11:40:35 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMQ0P-0000000AoX3-2WCz
	for kvm-riscv@lists.infradead.org;
	Tue, 03 Jun 2025 11:40:34 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-3a4ebbfb18fso751468f8f.3
        for <kvm-riscv@lists.infradead.org>; Tue, 03 Jun 2025 04:40:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1748950832; x=1749555632; darn=lists.infradead.org;
        h=in-reply-to:references:to:cc:subject:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MqVabgXFstwYrAYyfsH8IvHqrVwku7JGFF8O9u+W/Po=;
        b=jPzShYnA0DLbo53xM4ZskTOjSo3afdnzUTB+ihr/ZeyNLrdj81htO35pcUKpHjp89G
         8b5rVvZTRHg67z43WAbrVwnR2ah5uaJccYyVfe672oJQVme2GIFwVN4jSItgi5Vet8UE
         pOiY5bekaFGLv4Hdp/UxNXjzNZkM0kj6evPHCNcHCEmdJZ23NUObGJqtq3HdfcFGHMsC
         NQDtDnt57iKKvE6aZ8uAsnJlezfwI6H+UHj8+r6sV7Vh97R8njJlwdJgn4uuFSit/Dn+
         /EZeBlASmvmKXTRhmiPtVsMSEryNvUH8tAqGT2vNYL2vCyOnLbCeFMoRYepEUBP0DU4C
         VWRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748950832; x=1749555632;
        h=in-reply-to:references:to:cc:subject:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MqVabgXFstwYrAYyfsH8IvHqrVwku7JGFF8O9u+W/Po=;
        b=UtpQSF5BpAvgSPQrenKCOC4bzhvNJbAWp12lnNVACXLwjC/uKaHr2bv45mGKdr8EGb
         /SxhfkYZITJiFqGMeIlwNh2xNvdbfqfA/hsPM6V1aGtIhARO4jkPagYhXLQC4U6Ls8BN
         G+aS5dgMLu//Waurp1R5bWRyjo+6gR34xNesrsmJmFgWtHBOMxVwJ15U7hsg5nXBIEkl
         c8qGqWs9lBejrybvSnkl0+AJ1v0A8SsRRVNLsiQCOe91zz7EsLAlIX/9QEzyq/2u6vUJ
         Gj0QYS2TXGqlTYe6AhHarcCircF/QXFqk/XlKVKXDtRzHWFFnG3ObXiLtWbeZW+K9z7X
         R3wA==
X-Forwarded-Encrypted: i=1; AJvYcCWX1ViAfWkaYzDq19BMjZvUM0xefnM3M37JToxVBbyFzdu1SPftgmuG0Ao/TilnfyDibtdthgXRb+o=@lists.infradead.org
X-Gm-Message-State: AOJu0YwIK9XiNauBcpLqaX4isE4OteRw5O69oY3EhfHnqPVvqsebKOkC
	xxwPKWdCw0OBZ/JrAbIElw0Qxzeq4oIZgTB/GNkQguBNoWHyDY6SyTfCegwxjcKUGis=
X-Gm-Gg: ASbGncuw4zPL0wUhfiO/cGnDtMO2nsmpuN1AVu7jf6aKbHJ7DPptu1FkanDMzL0C8QM
	/US4wIJxl073R2D+t6SywjpOFam95wObQPoqVBKBaBm9T/TwvGsi5IGt4bQ2TS/X6pUHMvXHZy4
	RKV2DIiIUrGhWxkKvyg22QHCbr17JVwUAiFeQvh8LHwerslKievJFNvDXDTuA9le+qz3VObXKzd
	d+VlAw19Ory5H45xFUf/pz24EI2xrCjMgW0WvcXQXcUDyKTyYFSIFm2g1pC7kYsSSICkrVaGitI
	de3WlEKTiPzI45pbUNfG6aptxpZAaFI5VQC5ndqGIHyfhntGLw+4DRsCC80=
X-Google-Smtp-Source: AGHT+IGFDhiWKgjK9Y+TCcxKDa8nUqu/n2RN/MNtIHJIhQEdhoO4uixfNqx5KKNaUAuRzy9bZilwyQ==
X-Received: by 2002:a05:6000:230d:b0:3a0:782e:9185 with SMTP id ffacd0b85a97d-3a4f895f857mr4292350f8f.2.1748950831495;
        Tue, 03 Jun 2025 04:40:31 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200:37e0:4ec0:b6ec:ef2a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4f0097210sm17962177f8f.73.2025.06.03.04.40.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 04:40:30 -0700 (PDT)
Mime-Version: 1.0
Date: Tue, 03 Jun 2025 13:40:30 +0200
Message-Id: <DACVBRLJ5MMV.1COZ83HBMUD6A@ventanamicro.com>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
Subject: Re: [PATCH v3 9/9] RISC-V: KVM: Upgrade the supported SBI version
 to 3.0
Cc: "Anup Patel" <anup@brainfault.org>, "Will Deacon" <will@kernel.org>,
 "Mark Rutland" <mark.rutland@arm.com>, "Paul Walmsley"
 <paul.walmsley@sifive.com>, "Palmer Dabbelt" <palmer@dabbelt.com>,
 "Mayuresh Chitale" <mchitale@ventanamicro.com>,
 <linux-riscv@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <kvm@vger.kernel.org>,
 <kvm-riscv@lists.infradead.org>, "linux-riscv"
 <linux-riscv-bounces@lists.infradead.org>
To: "Atish Patra" <atish.patra@linux.dev>, "Andrew Jones"
 <ajones@ventanamicro.com>
References: <20250522-pmu_event_info-v3-0-f7bba7fd9cfe@rivosinc.com>
 <20250522-pmu_event_info-v3-9-f7bba7fd9cfe@rivosinc.com>
 <DA3KSSN3MJW5.2CM40VEWBWDHQ@ventanamicro.com>
 <61627296-6f94-45ea-9410-ed0ea2251870@linux.dev>
 <DA5YWWPPVCQW.22VHONAQHOCHE@ventanamicro.com>
 <20250526-224478e15ee50987124a47ac@orel>
 <ace8be22-3dba-41b0-81f0-bf6d661b4343@linux.dev>
 <20250528-ff9f6120de39c3e4eefc5365@orel>
 <1169138f-8445-4522-94dd-ad008524c600@linux.dev>
 <DA8KL716NTCA.2QJX4EW2OI6AL@ventanamicro.com>
 <2bac252c-883c-4f8a-9ae1-283660991520@linux.dev>
 <DA9G60UI0ZLC.1KIWBXCTX0427@ventanamicro.com>
 <0dcd01cd-419f-4225-b22c-cbaf82718235@linux.dev>
In-Reply-To: <0dcd01cd-419f-4225-b22c-cbaf82718235@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_044033_642497_7BD838B0 
X-CRM114-Status: GOOD (  17.07  )
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

MjAyNS0wNS0zMFQxMjoyOTozMC0wNzowMCwgQXRpc2ggUGF0cmEgPGF0aXNoLnBhdHJhQGxpbnV4
LmRldj46Cj4gT24gNS8zMC8yNSA0OjA5IEFNLCBSYWRpbSBLcsSNbcOhxZkgd3JvdGU6Cj4+IDIw
MjUtMDUtMjlUMTE6NDQ6MzgtMDc6MDAsIEF0aXNoIFBhdHJhIDxhdGlzaC5wYXRyYUBsaW51eC5k
ZXY+Ogo+Pj4gT24gNS8yOS8yNSAzOjI0IEFNLCBSYWRpbSBLcsSNbcOhxZkgd3JvdGU6Cj4+Pj4g
SSBvcmlnaW5hbGx5IGdhdmUgdXAgb24gdGhlIGlkZWEsIGJ1dCBJIGZlZWwga2luZGEgYmFkIGZv
ciBEcmV3IG5vdywgc28KPj4+PiB0cnlpbmcgYWdhaW46Cj4+PiBJIGFtIHNvcnJ5IGlmIHNvbWUg
b2YgbXkgcmVwbGllcyBjYW1lIGFjcm9zcyBpbiB0aGUgd3Jvbmcgd2F5LiBUaGF0IHdhcwo+Pj4g
bmV2ZXIKPj4+IHRoZSBpbnRlbnRpb24uCj4+IEkgZGlkbid0IG1lYW4gdG8gYWNjdXNlIHlvdSwg
bXkgYXBvbG9naWVzLiAgSSBhZ3JlZSB3aXRoIERyZXcncwo+PiBwb3NpdGlvbnMsIHNvIHRvIGV4
cGFuZCBvbiBhIHF1ZXN0aW9uIHRoYXQgd2Fzbid0IHRvdWNoZWQgaW4gaGlzIG1haWw6Cj4+Cj4+
Pj4gRXZlbiBpZiB1c2Vyc3BhY2Ugd2FudHMgU0JJIGZvciB0aGUgTS1tb2RlIGludGVyZmFjZSwg
c2VjdXJpdHkgbWluZGVkCj4+PiBUaGlzIGlzIHByb2JhYmx5IGEgM3JkIG9uZSA/IFdoeSB3ZSB3
YW50IE0tbW9kZSBpbnRlcmZhY2UgaW4gdGhlIHVzZXIKPj4+IHNwYWNlID8KPj4gSXQgaXMgYWJv
dXQgdHVybmluZyBLVk0gaW50byBhbiBJU0EgYWNjZWxlcmF0b3IuCj4+Cj4+IEEgZ3Vlc3QgdGhp
bmtzIGl0IGlzIHJ1bm5pbmcgaW4gUy9IUy1tb2RlLgo+PiBUaGUgZWNhbGwgaW5zdHJ1Y3Rpb24g
dHJhcHMgdG8gTS1tb2RlLiAgUklTQy1WIEggZXh0ZW5zaW9uIGRvZXNuJ3QKPj4gYWNjZWxlcmF0
ZSBNLW1vZGUsIHNvIHdlIGhhdmUgdG8gZW11bGF0ZSB0aGUgdHJhcCBpbiBzb2Z0d2FyZS4KPiBX
ZSBkb24ndCBuZWVkIHRvIGFjY2VsZXJhdGUgTS1tb2RlLiBUaGF0J3MgdGhlIGJlYXV0eSBvZiB0
aGUgUklTQy1WIEggCj4gZXh0ZW5zaW9uLgoKKEl0IGlzIGEgZ2FwIHRvIG1lLiA6XSkKCj4gVGhl
IElTQSBpcyBkZXNpZ25lZCBpbiBzdWNoIGEgd2F5IHRoYXQgdGhlIFNCSSBpcyB0aGUgaW50ZXJm
YWNlIGJldHdlZW4gCj4gdGhlIHN1cGVydmlzb3IgZW52aXJvbm1lbnQgKFZTL0hTKQo+IGFuZCB0
aGUgc3VwZXJ2aXNvciBleGVjdXRpb24gZW52aXJvbm1lbnQgKEhTL00pLgoKVGhlIElTQSBzYXlz
IG5vdGhpbmcgYWJvdXQgdGhlIGltcGxlbWVudGF0aW9uIG9mIHNhaWQgaW50ZXJmYWNlLgoKUmV0
dXJuaW5nIDQyIGluIHgyMSBhcyBhIHJlc3BvbnNlIHRvIGFuIGVjYWxsIHdpdGggMHgxMCBpbiBh
NyBhbmQgMHgzIGluCmE2IGlzIHBlcmZlY3RseSB2YWxpZCBSSVNDLVYgaW1wbGVtZW50YXRpb24g
dGhhdCBLVk0gY3VycmVudGx5IGNhbm5vdAp2aXJ0dWFsaXplLgoKPj4gVGhlIElTQSBkb2Vzbid0
IHNheSB0aGF0IE0tbW9kZSBtZWFucyBTQkkuICBXZSB0cnkgcmVhbGx5IGhhcmQgdG8gaGF2ZQo+
PiBTQkkgb24gYWxsIFJJU0MtViwgYnV0IEkgdGhpbmsgS1ZNIGlzIHRha2luZyBpdCBhIGJpdCB0
b28gZmFyLgo+Pgo+PiBXZSBjYW4gZGlzY3VzcyBob3cgYmVzdCB0byBkZXNjcmliZSBTQkksIHNv
IHVzZXJzcGFjZSBjYW4gY2hvb3NlIHRvCj4+IGFjY2VsZXJhdGUgdGhlIE0tbW9kZSBpbiBLVk0s
IGJ1dCBJIHRoaW5rIHRoYXQgdGhlIGFiaWxpdHkgdG8gZW11bGF0ZQo+PiBNLW1vZGUgaW4gdXNl
cnNwYWNlIHNob3VsZCBiZSBwcm92aWRlZC4KPiBJIGFtIHN0aWxsIHRyeWluZyB0byB1bmRlcnN0
YW5kIHRoZSBhZHZhbnRhZ2VzIG9mIGVtdWxhdGluZyB0aGUgTS1tb2RlIAo+IGluIHRoZSB1c2Vy
IHNwYWNlLgo+IENhbiB5b3UgcGxlYXNlIGVsYWJvcmF0ZSA/CgpUaGlzIHRocmVhZCBhbHJlYWR5
IGhhcyBhIGxvdCBvZiB0aGVtLCBzbyB0byBhdm9pZCByZXBlYXRpbmcgdGhlbSwgSQpoYXZlIHRv
IGdvIGludG8gcXVpdGUgbmljaGUgdXNlLWNhc2VzOgpXaGVuIGRldmVsb3BpbmcgTS1tb2RlIHNv
ZnR3YXJlIG9uIFJJU0MtViAod2hlbiBSSVNDLVYgaGFzIG1vcmUgdXNlZnVsCmltcGxlbWVudGF0
aW9ucyB0aGFuIFFFTVUpLCBhIGRldmVsb3BlciBtaWdodCB3YW50IHRvIGFjY2VsZXJhdGUgdGhl
ClMvVS1tb2RlcyBpbiBLVk0uCkl0IGlzIGFsc28gc2ltcGxlciB0byBpbXBsZW1lbnQgYW4gb2xk
IFNCSSBpbnRlcmZhY2UgKGVzcGVjaWFsbHkgd2l0aApidWdzL3F1aXJrcykgaWYgdmlydHVhbGl6
YXRpb24ganVzdCBleGVjdXRlcyB0aGUgb2xkIE0tbW9kZSBiaW5hcnkuCgpXaHkgbXVzdCBLVk0g
cHJldmVudCB1c2Vyc3BhY2UgZnJvbSB2aXJ0dWFsaXppbmcgUklTQy1WPwoKPiBJIGFtIGFzc3Vt
aW5nIHlvdSBhcmUgbm90IGhpbnRpbmcgTmVzdGVkIHZpcnR1YWxpemF0aW9uIHdoaWNoIGNhbiBi
ZSAKPiBhY2hpZXZlZCB3aXRoIGV4aXN0aW5nCj4gSVNBIHByb3ZpZGVkIG1lY2hhbmlzbXMgYW5k
IGFjY2VsZXJhdGVkIGJ5IFNCSSBOQUNMLgoKUmlnaHQsIEkgYW0gdGFsa2luZyBhYm91dCB2aXJ0
dWFsaXphdGlvbiBvZiBSSVNDLVYsIGJlY2F1c2UgSSBkb24ndCBoYXZlCmEgY3J5c3RhbCBiYWxs
IHRvIGZpZ3VyZSBvdXQgd2hhdCB1c2VycyB3aWxsIHdhbnQuCgotLSAKa3ZtLXJpc2N2IG1haWxp
bmcgbGlzdAprdm0tcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2t2bS1yaXNjdgo=
