Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67AE9CAC58F
	for <kvm-riscv@archiver.kernel.org>; Tue,  9 Sep 2025 16:02:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5488z9Q85SnQqSGvwwOy1VbqQYoRYEM3iL1aCZ0Qy30=; b=tqcnak1uPCO3VI
	usfxDjvxZMzuUm1QnNoPmIyuSYsryrrZoGvElRTdoMhwZkycXGyxWbaAf+04Lt8xBEEiojC/IilL1
	JMa3zjI/EE+dMCqVSEqjUJI32j+aQwC+2I3mIMujTnxEXdBODFR7yW8tqH+rBCHoTik5CvqT5l01L
	mCzz64KPh1/IIKuMtOCcI5CX3ZShje3nvBgPHJ7k/iQdkvCa+KAjp3WrBqV755JrDDBtRsHj4v5fL
	yE5nBRHaBX/Hx/na6jB5UYbDNXavSy3S9J2OXrURG0XYB0jh9sDeZUgqXxY/EeXocpo/H8/cFU8QM
	jr8K/7rx/Jx7pInyAUNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw0nX-00000008Ne0-0Snb;
	Tue, 09 Sep 2025 16:02:23 +0000
Received: from mail-il1-x12d.google.com ([2607:f8b0:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvy6M-00000007HeV-3Z2G
	for kvm-riscv@lists.infradead.org;
	Tue, 09 Sep 2025 13:09:40 +0000
Received: by mail-il1-x12d.google.com with SMTP id e9e14a558f8ab-3f660084016so34218935ab.3
        for <kvm-riscv@lists.infradead.org>; Tue, 09 Sep 2025 06:09:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1757423378; x=1758028178; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Et6v9MZbTk1pFS1bUNfiOVICylxCPX59YZSHQ0yE1r8=;
        b=22HJGdUZzONr0ZD0+xOPFOEQfRMkBmjbYGtG8r8qrBHSYo0bdjtXMYJX1h7jmDnlyI
         8igN3ONnzL/xsIDa+WbTtlaXf7L4/qv0MK5sS8xvzZj0W7WxGRKynP/hom5HE/67UQW9
         yKC2e2cuaj9oOfp9oxfBAnkvmjtzzJqsK23hK8UX1Vxv2UQPyO0lYxgwzV1fXzHbsJne
         EzKIVrfz5GFDjos5ZopUz7fHsmL3q8dQyUzglTU2RMp1fq8ufz1IKIHFSJScmOsF23cR
         Z4VQtl0SKf5pslLH/FPQh36B/Y8HJHBQ7HV88zjdVm+Yzep1mvnGbg20kuTYG5fe+tYM
         0gkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757423378; x=1758028178;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Et6v9MZbTk1pFS1bUNfiOVICylxCPX59YZSHQ0yE1r8=;
        b=o5jRBazScf7uQbJhwfxyqO1pT32Sz3NfLiUpHQy36AP62y2AdmSgfaCKU/hoQfnRhW
         BZN8gKFntMSo5bO85Jxj6M4a11/uG3gTcawDdyTKCOrvi0wc9QbZ3x9yU2ZwQNvIYlOd
         bTfWoKAn+GqRTHJGhqn7mRm3zphWvT6cEdmxYE8WQOEgPeh8n1QRLToQXUlI4JV7WceR
         8xv5vesUEB12H3qMQ+CUtayUBYCfxHCMnVpSXI6MGJq+oPEknO/X8CrFTGhNtIWBPTWY
         6LFY1DKsaxqAZdeGsRRiEE9nv5pdXZPnDV00fEbfrltImgxEuL5TDk52pM70Uybfda9A
         LDMg==
X-Forwarded-Encrypted: i=1; AJvYcCWuYZYAH5+owQmm6EampCq7EuZfU/g8EM6HLrugM+B/C/pT1kSJk0xr7+6af6k0Ohu5/Yl5Y7TO18o=@lists.infradead.org
X-Gm-Message-State: AOJu0YxhWHNtZ2Art2PHrfAOChx8FFYD3EdeMmIenA+9HRMx06Tf5WoV
	jQa5WWe8vEDDVb4Ota6Xb3PVHAXrrdRQdP9BgwETPmFs50v1GP31GpQdMURle75bd0xXQR6loRT
	U48GBvVuiyqpAHIRmztFqHrke3ZsmTe67z3GN27G7OA==
X-Gm-Gg: ASbGncvtvbJTU8IvUZJ1HgBEeI6DDNAVttwI/V5dTkqwGu4ZdWCsFlwihJCs0wwwKPk
	Lv+SGmyU7P7mpKMKgbEQ/OOhVYMT4phQpIHMLCJJXH9JBZRsmjiN0TbU8XNu6E3XDsu+sCPnw23
	mkfi2dMKn0t/JsjAYyw/ouJvgBF3Ngs6asfxGTNxJ2e9w3/jCasBJBp1GAiS7m7HFOt9czphBQr
	aLXu8yaW/W0MWyMA/Km7jnRT/yz3ujdAVWW7JzGR7kW9ebgg2k=
X-Google-Smtp-Source: AGHT+IFiVfiLe6MDTgLYfQVJM+7bIAvkNGpPq9pKFcNmWNcz88mlHx0Ry1czmNGFbXc2GRPs/CcX2si0gv35Hm7838E=
X-Received: by 2002:a92:ca0a:0:b0:3f6:5e42:9ec3 with SMTP id
 e9e14a558f8ab-3fd8e3d3a50mr168551415ab.11.1757423377758; Tue, 09 Sep 2025
 06:09:37 -0700 (PDT)
MIME-Version: 1.0
References: <20250909-pmu_event_info-v6-0-d8f80cacb884@rivosinc.com> <20250909-pmu_event_info-v6-6-d8f80cacb884@rivosinc.com>
In-Reply-To: <20250909-pmu_event_info-v6-6-d8f80cacb884@rivosinc.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 9 Sep 2025 18:39:26 +0530
X-Gm-Features: Ac12FXwwmRiHCZkeiCDOhDongtd-pqDmF7dqaj5xnX2k1zEPMqCjDokehycy2ss
Message-ID: <CAAhSdy3d31yEBM3rpy4N3jmL0PovU_VSYuo7niGduuqknXdmGQ@mail.gmail.com>
Subject: Re: [PATCH v6 6/8] RISC-V: KVM: No need of explicit writable slot check
To: Atish Patra <atishp@rivosinc.com>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Mayuresh Chitale <mchitale@ventanamicro.com>, linux-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	Sean Christopherson <seanjc@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_060938_894934_65222001 
X-CRM114-Status: GOOD (  17.72  )
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

T24gVHVlLCBTZXAgOSwgMjAyNSBhdCAxMjozM+KAr1BNIEF0aXNoIFBhdHJhIDxhdGlzaHBAcml2
b3NpbmMuY29tPiB3cm90ZToKPgo+IFRoZXJlIGlzIG5vdCBtdWNoIHZhbHVlIGluIGNoZWNraW5n
IGlmIGEgbWVtc2xvdCBpcyB3cml0YWJsZSBleHBsaWNpdGx5Cj4gYmVmb3JlIGEgd3JpdGUgYXMg
aXQgbWF5IGNoYW5nZSB1bmRlcm5lYXRoIGFmdGVyIHRoZSBjaGVjay4gUmF0aGVyLCByZXR1cm4K
PiBpbnZhbGlkIGFkZHJlc3MgZXJyb3Igd2hlbiB3cml0ZV9ndWVzdCBmYWlscyBhcyBpdCBjaGVj
a3MgaWYgdGhlIHNsb3QKPiBpcyB3cml0YWJsZSBhbnl3YXlzLgo+Cj4gU3VnZ2VzdGVkLWJ5OiBT
ZWFuIENocmlzdG9waGVyc29uIDxzZWFuamNAZ29vZ2xlLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBB
dGlzaCBQYXRyYSA8YXRpc2hwQHJpdm9zaW5jLmNvbT4KCkxHVE0uCgpSZXZpZXdlZC1ieTogQW51
cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9yZz4KClJlZ2FyZHMsCkFudXAKCj4gLS0tCj4gIGFy
Y2gvcmlzY3Yva3ZtL3ZjcHVfcG11LmMgICAgIHwgMTEgKystLS0tLS0tLS0KPiAgYXJjaC9yaXNj
di9rdm0vdmNwdV9zYmlfc3RhLmMgfCAgOSArKy0tLS0tLS0KPiAgMiBmaWxlcyBjaGFuZ2VkLCA0
IGluc2VydGlvbnMoKyksIDE2IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlz
Y3Yva3ZtL3ZjcHVfcG11LmMgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1X3BtdS5jCj4gaW5kZXggMTVk
NzFhN2I3NWJhLi5mODUxNDA4NmJkNmIgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9rdm0vdmNw
dV9wbXUuYwo+ICsrKyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfcG11LmMKPiBAQCAtNDA5LDggKzQw
OSw2IEBAIGludCBrdm1fcmlzY3ZfdmNwdV9wbXVfc25hcHNob3Rfc2V0X3NobWVtKHN0cnVjdCBr
dm1fdmNwdSAqdmNwdSwgdW5zaWduZWQgbG9uZyBzCj4gICAgICAgICBpbnQgc25hcHNob3RfYXJl
YV9zaXplID0gc2l6ZW9mKHN0cnVjdCByaXNjdl9wbXVfc25hcHNob3RfZGF0YSk7Cj4gICAgICAg
ICBpbnQgc2JpcmV0ID0gMDsKPiAgICAgICAgIGdwYV90IHNhZGRyOwo+IC0gICAgICAgdW5zaWdu
ZWQgbG9uZyBodmE7Cj4gLSAgICAgICBib29sIHdyaXRhYmxlOwo+Cj4gICAgICAgICBpZiAoIWt2
cG11IHx8IGZsYWdzKSB7Cj4gICAgICAgICAgICAgICAgIHNiaXJldCA9IFNCSV9FUlJfSU5WQUxJ
RF9QQVJBTTsKPiBAQCAtNDMyLDE5ICs0MzAsMTQgQEAgaW50IGt2bV9yaXNjdl92Y3B1X3BtdV9z
bmFwc2hvdF9zZXRfc2htZW0oc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCB1bnNpZ25lZCBsb25nIHMK
PiAgICAgICAgICAgICAgICAgZ290byBvdXQ7Cj4gICAgICAgICB9Cj4KPiAtICAgICAgIGh2YSA9
IGt2bV92Y3B1X2dmbl90b19odmFfcHJvdCh2Y3B1LCBzYWRkciA+PiBQQUdFX1NISUZULCAmd3Jp
dGFibGUpOwo+IC0gICAgICAgaWYgKGt2bV9pc19lcnJvcl9odmEoaHZhKSB8fCAhd3JpdGFibGUp
IHsKPiAtICAgICAgICAgICAgICAgc2JpcmV0ID0gU0JJX0VSUl9JTlZBTElEX0FERFJFU1M7Cj4g
LSAgICAgICAgICAgICAgIGdvdG8gb3V0Owo+IC0gICAgICAgfQo+IC0KPiAgICAgICAgIGt2cG11
LT5zZGF0YSA9IGt6YWxsb2Moc25hcHNob3RfYXJlYV9zaXplLCBHRlBfQVRPTUlDKTsKPiAgICAg
ICAgIGlmICgha3ZwbXUtPnNkYXRhKQo+ICAgICAgICAgICAgICAgICByZXR1cm4gLUVOT01FTTsK
Pgo+ICsgICAgICAgLyogTm8gbmVlZCB0byBjaGVjayB3cml0YWJsZSBzbG90IGV4cGxpY2l0bHkg
YXMga3ZtX3ZjcHVfd3JpdGVfZ3Vlc3QgZG9lcyBpdCBpbnRlcm5hbGx5ICovCj4gICAgICAgICBp
ZiAoa3ZtX3ZjcHVfd3JpdGVfZ3Vlc3QodmNwdSwgc2FkZHIsIGt2cG11LT5zZGF0YSwgc25hcHNo
b3RfYXJlYV9zaXplKSkgewo+ICAgICAgICAgICAgICAgICBrZnJlZShrdnBtdS0+c2RhdGEpOwo+
IC0gICAgICAgICAgICAgICBzYmlyZXQgPSBTQklfRVJSX0ZBSUxVUkU7Cj4gKyAgICAgICAgICAg
ICAgIHNiaXJldCA9IFNCSV9FUlJfSU5WQUxJRF9BRERSRVNTOwo+ICAgICAgICAgICAgICAgICBn
b3RvIG91dDsKPiAgICAgICAgIH0KPgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2t2bS92Y3B1
X3NiaV9zdGEuYyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfc2JpX3N0YS5jCj4gaW5kZXggY2M2Y2I3
YzhmMGU0Li5jYWFhMjg0NjBjYTQgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9rdm0vdmNwdV9z
Ymlfc3RhLmMKPiArKysgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1X3NiaV9zdGEuYwo+IEBAIC04NSw4
ICs4NSw2IEBAIHN0YXRpYyBpbnQga3ZtX3NiaV9zdGFfc3RlYWxfdGltZV9zZXRfc2htZW0oc3Ry
dWN0IGt2bV92Y3B1ICp2Y3B1KQo+ICAgICAgICAgdW5zaWduZWQgbG9uZyBzaG1lbV9waHlzX2hp
ID0gY3AtPmExOwo+ICAgICAgICAgdTMyIGZsYWdzID0gY3AtPmEyOwo+ICAgICAgICAgc3RydWN0
IHNiaV9zdGFfc3RydWN0IHplcm9fc3RhID0gezB9Owo+IC0gICAgICAgdW5zaWduZWQgbG9uZyBo
dmE7Cj4gLSAgICAgICBib29sIHdyaXRhYmxlOwo+ICAgICAgICAgZ3BhX3Qgc2htZW07Cj4gICAg
ICAgICBpbnQgcmV0Owo+Cj4gQEAgLTExMSwxMyArMTA5LDEwIEBAIHN0YXRpYyBpbnQga3ZtX3Ni
aV9zdGFfc3RlYWxfdGltZV9zZXRfc2htZW0oc3RydWN0IGt2bV92Y3B1ICp2Y3B1KQo+ICAgICAg
ICAgICAgICAgICAgICAgICAgIHJldHVybiBTQklfRVJSX0lOVkFMSURfQUREUkVTUzsKPiAgICAg
ICAgIH0KPgo+IC0gICAgICAgaHZhID0ga3ZtX3ZjcHVfZ2ZuX3RvX2h2YV9wcm90KHZjcHUsIHNo
bWVtID4+IFBBR0VfU0hJRlQsICZ3cml0YWJsZSk7Cj4gLSAgICAgICBpZiAoa3ZtX2lzX2Vycm9y
X2h2YShodmEpIHx8ICF3cml0YWJsZSkKPiAtICAgICAgICAgICAgICAgcmV0dXJuIFNCSV9FUlJf
SU5WQUxJRF9BRERSRVNTOwo+IC0KPiArICAgICAgIC8qIE5vIG5lZWQgdG8gY2hlY2sgd3JpdGFi
bGUgc2xvdCBleHBsaWNpdGx5IGFzIGt2bV92Y3B1X3dyaXRlX2d1ZXN0IGRvZXMgaXQgaW50ZXJu
YWxseSAqLwo+ICAgICAgICAgcmV0ID0ga3ZtX3ZjcHVfd3JpdGVfZ3Vlc3QodmNwdSwgc2htZW0s
ICZ6ZXJvX3N0YSwgc2l6ZW9mKHplcm9fc3RhKSk7Cj4gICAgICAgICBpZiAocmV0KQo+IC0gICAg
ICAgICAgICAgICByZXR1cm4gU0JJX0VSUl9GQUlMVVJFOwo+ICsgICAgICAgICAgICAgICByZXR1
cm4gU0JJX0VSUl9JTlZBTElEX0FERFJFU1M7Cj4KPiAgICAgICAgIHZjcHUtPmFyY2guc3RhLnNo
bWVtID0gc2htZW07Cj4gICAgICAgICB2Y3B1LT5hcmNoLnN0YS5sYXN0X3N0ZWFsID0gY3VycmVu
dC0+c2NoZWRfaW5mby5ydW5fZGVsYXk7Cj4KPiAtLQo+IDIuNDMuMAo+CgotLSAKa3ZtLXJpc2N2
IG1haWxpbmcgbGlzdAprdm0tcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2t2bS1yaXNjdgo=
