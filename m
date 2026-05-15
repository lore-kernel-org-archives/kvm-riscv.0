Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40A8FCD4851
	for <kvm-riscv@archiver.kernel.org>; Fri, 15 May 2026 06:49:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o9Djeg4IuL8nZmoC/yluUjyqcPt6856xIR4/XlHiYmE=; b=HoHMbpkJPiU0rw
	DcKtpVMWg4LPHBcXxK7Od0id+F75lq6YlUghE6pG+RPRIKq0JLBIdFJnvTzFnSqU4vL1uqLsAS/Eu
	PduuyCkT1VzcIwacat4Hcf7H8D96E+1Go1dX7rjQ9ouReBanaKxmYneQk9UtP5daxAR5xDATn9JF8
	386m+kpaShGX9OwgPTtFuB0cEP2ulgsTlZo7K3idB71xIsLzoJmx7Lc+a5KtvNTupIsCZZgzXdrBi
	0enVaft8iBHcNoGH/o32HA7f84THeP3J4elAAgKyIEbi4XfGjOW8FqkLha+It+RydRuYXIBawG8Ux
	aF9SW96e5P8Udez93A2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNmM2-00000007XbK-2ewg;
	Fri, 15 May 2026 06:49:02 +0000
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNmM0-00000007Xar-0RNI
	for kvm-riscv@lists.infradead.org;
	Fri, 15 May 2026 06:49:01 +0000
Received: by mail-ot1-x32b.google.com with SMTP id 46e09a7af769-7de4be15125so7236322a34.0
        for <kvm-riscv@lists.infradead.org>; Thu, 14 May 2026 23:48:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778827739; cv=none;
        d=google.com; s=arc-20240605;
        b=DXJhuwtTAcAqaqT+LI/w2Mx4tL/41Lr2R4yMF2Ze7B+f4os8+yXDKYh11zg1FBnWYy
         ggZIoNVPF+qnGF4k8eqshdmQ8sCVEOnh5Nh1XxX3OGkFTMbwPpGneY/hI16gx0aQEKr/
         WAP4E40u57ZsSQPVIteGrs7k+xdkY7wBxEYc5NOsvy7Nc/6SUPloO1XlQdTjUUdF+pET
         lMZvz70uz8Jn0rajj7miAjL1+hKPR+p+k0rCQorD3zC9coqcbBJp/+mnBs/bzxECWwr5
         FcpouDQrmbrJHWDEreCagDTTll0UykNc/UiRy4SkPHpGvCfxQJSFbMzVD7iS1kSJhkDO
         DfsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MJZeZoi3lwfWnxM/Nl8ZViqM1Fkj9v9XGZB4s5D/a8M=;
        fh=THiaS8sq3+69dxx+TkOCbQkwC/RMBS6lLh6iA8PjKFo=;
        b=kNxyyiXUGfAbZDDaTDya3GHL750vI9/wQGm8aTEN3eUa/hoH/nqY0GVsV8K51GLYaw
         FRhIuJHxMtRtTMYQ5aQlAWYEfYJDCQJoiXVSRummJS2HZaHDcBdLxebHQbrMSYFllVWa
         NQFEjPA6N0ByhSfPLlKwXJCLLteq8YjFdoVn3VjqyQRKGOw5/SVCgt9751GRLSCj2DME
         qCL1HRuWLABb1oh5S7HDJOLo+C1VTE0hbpSEIYEMtlaV/kZG0uVGJfTOnndrQPT/NMX7
         cYQDeTJCCMkjsWlv82r5kRis78nWkCiGO3Qliv5CaE8cMBtFEoUyPXnqJev1w9ER4GeQ
         fC9w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1778827739; x=1779432539; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MJZeZoi3lwfWnxM/Nl8ZViqM1Fkj9v9XGZB4s5D/a8M=;
        b=dQqNSza7D9fXBUgBNB3x7dWdAWjWYSTVVsJ/TC7S1oGyJXwLnBqFQKszTWcXqDaUfy
         mFiAf7W1meWpjkDOhJcXBOc6DVKZewd2QTJGF5OJVQNRQ+bq5M+RCPvDFh3yQQ3pyARV
         Hg0WATFvpi+5UjvT2l+oqd27BHjxysQ9Br+PuawBbVO8MPHwA2/WgzHVjHgNtjMAjvh+
         dBzuLsd4B1zBP6j5Usog6KqP+oEuharTNYw2gAMKqGWYgl16htCCtTWYXYAso3zrNd2X
         +ogQdbqwjsUJkiPnMCaQBOxp/7hIMf3Thg6ixafc2h9MVDKMEQifz/zYcq07cAU4dmH9
         BUAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778827739; x=1779432539;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MJZeZoi3lwfWnxM/Nl8ZViqM1Fkj9v9XGZB4s5D/a8M=;
        b=tFkoE2tgwpuZ1yyUm+kDpQqdj54r6vkRZbaiZefv1AtCMmG8dXCaxx3arsFIRKrVmu
         4nUqRPbnHgWlG7Dgd+o8sSigAgWWBMJUbUmWsD7PcwL7LTty0muCywSt1nEgnqobULoJ
         Z2UDU/5/cyZo+8kXpm17TgBR4P9P+jcqQwY9XzzJ65rzOCEWVOMii4s8fjYUuLZDikZQ
         6vFePaKzQuYCYgAQHF5pbqxRNAyDtiM20tpuE/e7xKG4qPQUsp36k0yTNBPKiui4htUe
         /k6mpDnbdbuYIw7H3ovmQ9z9TdjGvSW198iT5Ks5DBg+GpdclEdTyE5dzyupyKnG5NBw
         UqLQ==
X-Forwarded-Encrypted: i=1; AFNElJ98V5wr8cvSNzIPjWS6Jb2vrMvrAKteUNYPdOqhxaB4W0dDXEc1dLdiwTqgF9GFVG4wJFN4qzCtEhk=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8QA8wDZs8dIuOhbweDOMV3FiH7BeKCQKFv4BYoP8fkHMoj6s9
	C0zPdNhohl4iub+ML+KGvkigrdAzPasNkuKuVVU3FnXxogh7EaPJqHX7tciYZURkHEpgTPbHZrc
	YBCzVr8n7+6uA7Dh8Rq1VNkrprvFoGp7jaFTqbuIbxw==
X-Gm-Gg: Acq92OFvHxXZxwGobww0f52ykSl8QFRIStfCmlL6zVJ9TXuQBH0zBgoyX1Mg6zgtr97
	LozMfK1QhWytmReXV7h/rVPbTiDjq37FLraMV6K9ka6TATmZufkI8pGe0a6a72fDcPeK4TP5/pj
	zoqEqoRARb3ET2Ma3dDLtXKnQociBxWNJVMFYrm3n534ldRP4KpvYYYlcC+3uhdnA8zrfjQK3qx
	gFXpXH0AnlQQQZJbih4QtXzfRJTKUvwYRUsKyrfX50M+lj1GthbILJ8KwaeK94/YuVr9bDs8KPR
	ifcFqZsQhkQvtLw3XXt6NV9TPbthog0pLatQVhJNdsjOF0NBbp0It1KLGwNNAGYLnxemDNAMdXO
	wRUsVThNRIJDS4TgEWPDdFg+zsts=
X-Received: by 2002:a05:6820:174b:b0:696:29cd:bf4b with SMTP id
 006d021491bc7-69c94b454admr1633046eaf.51.1778827738723; Thu, 14 May 2026
 23:48:58 -0700 (PDT)
MIME-Version: 1.0
References: <20260514173642.41448-1-osama.abdelkader@gmail.com>
In-Reply-To: <20260514173642.41448-1-osama.abdelkader@gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 15 May 2026 12:18:45 +0530
X-Gm-Features: AVHnY4K8xzqoM5FY20mXX1nYOkYmhUWalyMOR_lK2NDzbN1JIwAiJwlW_5f4ndQ
Message-ID: <CAAhSdy1W_cQW0NfA6b3hX8CGtShZPgwbk1hhRB0jns6Dm+b9gg@mail.gmail.com>
Subject: Re: [PATCH 1/2] riscv: kvm: return SBI_ERR_FAILURE for
 pmu_snapshot_set_shmem OOM
To: Osama Abdelkader <osama.abdelkader@gmail.com>
Cc: Atish Patra <atish.patra@linux.dev>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Andrew Jones <ajones@ventanamicro.com>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_234900_277064_D56D7B52 
X-CRM114-Status: GOOD (  16.41  )
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

T24gVGh1LCBNYXkgMTQsIDIwMjYgYXQgMTE6MDbigK9QTSBPc2FtYSBBYmRlbGthZGVyCjxvc2Ft
YS5hYmRlbGthZGVyQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBrdm1fcmlzY3ZfdmNwdV9wbXVfc25h
cHNob3Rfc2V0X3NobWVtKCkgcmV0dXJuZWQgLUVOT01FTSBmcm9tIHRoZQo+IFNCSSBleHRlbnNp
b24gaGFuZGxlciwgd2hpY2ggY2F1c2VkIGt2bV9yaXNjdl92Y3B1X3NiaV9lY2FsbCgpIHRvCj4g
YWJvcnQgS1ZNX1JVTiBhbmQgc3VyZmFjZSB0aGUgZXJyb3IgdG8gdXNlcnNwYWNlIGluc3RlYWQg
b2YKPiBvbXBsZXRpbmcgdGhlIEVDQUxMIHdpdGggYSBuZWdhdGl2ZSBTQkkgZXJyb3IgaW4gYTAu
Cj4gVXNlIFNCSV9FUlJfRkFJTFVSRSBhbmQgdGhlIG5vcm1hbCByZXRkYXRhIHBhdGgsIG1hdGNo
aW5nIG90aGVyIFBNVQo+IGhhbmRsZXJzIGFuZCBrdm1fc2JpX2V4dF9wbXVfaGFuZGxlciBjb21t
ZW50Lgo+Cj4gRml4ZXM6IGMyZjQxZGRiY2RkNyAoIlJJU0MtVjogS1ZNOiBJbXBsZW1lbnQgU0JJ
IFBNVSBTbmFwc2hvdCBmZWF0dXJlIikKPiBDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZwo+IFNp
Z25lZC1vZmYtYnk6IE9zYW1hIEFiZGVsa2FkZXIgPG9zYW1hLmFiZGVsa2FkZXJAZ21haWwuY29t
PgoKTEdUTS4KClJldmlld2VkLWJ5OiBBbnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1bHQub3JnPgoK
UXVldWVkIHRoaXMgYXMgZml4IGZvciBMaW51eC03LjEtcmNYCgpUaGFua3MsCkFudXAKCgo+IC0t
LQo+ICBhcmNoL3Jpc2N2L2t2bS92Y3B1X3BtdS5jIHwgNiArKysrLS0KPiAgMSBmaWxlIGNoYW5n
ZWQsIDQgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9hcmNo
L3Jpc2N2L2t2bS92Y3B1X3BtdS5jIGIvYXJjaC9yaXNjdi9rdm0vdmNwdV9wbXUuYwo+IGluZGV4
IGE5MzVlZDk2YmMxNy4uOTFhYTAxNTVhNDIwIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yva3Zt
L3ZjcHVfcG11LmMKPiArKysgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1X3BtdS5jCj4gQEAgLTQ1Myw4
ICs0NTMsMTAgQEAgaW50IGt2bV9yaXNjdl92Y3B1X3BtdV9zbmFwc2hvdF9zZXRfc2htZW0oc3Ry
dWN0IGt2bV92Y3B1ICp2Y3B1LCB1bnNpZ25lZCBsb25nIHMKPiAgICAgICAgIH0KPgo+ICAgICAg
ICAga3ZwbXUtPnNkYXRhID0ga3phbGxvYyhzbmFwc2hvdF9hcmVhX3NpemUsIEdGUF9BVE9NSUMp
Owo+IC0gICAgICAgaWYgKCFrdnBtdS0+c2RhdGEpCj4gLSAgICAgICAgICAgICAgIHJldHVybiAt
RU5PTUVNOwo+ICsgICAgICAgaWYgKCFrdnBtdS0+c2RhdGEpIHsKPiArICAgICAgICAgICAgICAg
c2JpcmV0ID0gU0JJX0VSUl9GQUlMVVJFOwo+ICsgICAgICAgICAgICAgICBnb3RvIG91dDsKPiAr
ICAgICAgIH0KPgo+ICAgICAgICAgLyogTm8gbmVlZCB0byBjaGVjayB3cml0YWJsZSBzbG90IGV4
cGxpY2l0bHkgYXMga3ZtX3ZjcHVfd3JpdGVfZ3Vlc3QgZG9lcyBpdCBpbnRlcm5hbGx5ICovCj4g
ICAgICAgICBpZiAoa3ZtX3ZjcHVfd3JpdGVfZ3Vlc3QodmNwdSwgc2FkZHIsIGt2cG11LT5zZGF0
YSwgc25hcHNob3RfYXJlYV9zaXplKSkgewo+IC0tCj4gMi40My4wCj4KCi0tIAprdm0tcmlzY3Yg
bWFpbGluZyBsaXN0Cmt2bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2Cg==
