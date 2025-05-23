Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D507BC3DA6D
	for <kvm-riscv@archiver.kernel.org>; Fri, 23 May 2025 10:22:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VQMDpvTjtgD3Z3Ens90FGuAvyi7v6GHs7IZqK707f48=; b=modfIGWTsZte/Z
	BSm62fWJjDZyFPFmNlpeKzMi43c+3R6V4q7FMFI7fcU0EG8qF5fXSk4YWeXAs5qG3KTQgpoxSigz3
	dMp/1j85GrnaOYITx1Us4eK6a5NpngnVhx91TKwN6cXwLcThPreF3htZayMQ+KjS7+mzLLaUeg8lR
	tUzdujQyfsW4WfSedasNapxTNopI0JaTtbV5+0ci3WhpgZcTv6whcEdFF42RjSh29vdF+pTRjwlSB
	W9QBeElx2rvzkRL1tZTMFVthc3zYvasRY5w/kTBVx4G8jTheC/8+Eq7l8fzTnMGaIVUZhLd+uTgpJ
	J8E3ewPA2JylMprht1nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIPYB-00000003aID-2PM4;
	Fri, 23 May 2025 10:22:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIPYA-00000003aGV-0vry
	for kvm-riscv@bombadil.infradead.org;
	Fri, 23 May 2025 10:22:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=L4S246g4wPo4d+7PdKHFRm08olDhB+ym0CPBTheC+H4=; b=HfutPK4jouj0AUR3UE3rXsdfHN
	VfrZCpLd8FG/ToaWGMj+z1Nt5M8cPiyrBGJLckkwgdAF4CPLirnKTLB/lwW5UvuF7fEnHD8qvThbT
	1Fs/v2r3LKolCYs4sxrjds/2aDqeYowRXDliL2csKS5PqaWux98mTXJb+IEcHnn8vfbf0zVCrCa3h
	/nKaRqli3+BfDq1RYg5JgD1JYiEd7Cqx3s3phJmqkK0j/LMPK0Ds/zQwG75c7nDhdxWlsQvvIvv8a
	yeNZCYkbkN6QxkTWbKVv5mqjEDec3/PH4drjgywwMhm96DhB1O4DdY6XQzXtNhX2VTHaVU+My9Xov
	nXTLwnAw==;
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uIPY6-00000001G49-01k1
	for kvm-riscv@lists.infradead.org;
	Fri, 23 May 2025 10:22:48 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-7399838db7fso692493b3a.0
        for <kvm-riscv@lists.infradead.org>; Fri, 23 May 2025 03:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747995764; x=1748600564; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L4S246g4wPo4d+7PdKHFRm08olDhB+ym0CPBTheC+H4=;
        b=X0j79XAvUb7B3Rm+LBnE7jAiWIewTmTsthHqYIZ3oi/Fg2hWb45W/0P++gVgOYH235
         mPB4YJmv4rvSJaU1S5xHQw4xIZ+gJyk8x5FvMyCNKUdVsTKTiF+K5JRHPDmpyleW9Qkr
         I8BA1Y/jHeml0UT5mGuWs1z/K7NkU8u59lUg4M811fbESB6KjRHaR50r/9/YZmukqkhG
         xqKzrI8JLCVTxrsCuhnOx2ISo+3kUspQW9gJYEoYd+WYPfbLazWo4zCvszZeR7yjMbAc
         To2wgSxpfCi1YL3nS/aozRJIr9ikBtkzXsN92BqGC6bk3XnJQVsJdbPGeaWowh1mhO07
         37sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747995764; x=1748600564;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L4S246g4wPo4d+7PdKHFRm08olDhB+ym0CPBTheC+H4=;
        b=KDV5dqU6iKO9tyoligjTJoSdPgzs5hRvgo3pX7VDPRJb1smtjwO39eo5N7HhxH1k1G
         1pWGTY8ftTFGPxmcKbyugoW7CgwX3gJykwwGqSouZaOkPPAaQEu4jZ60KypXIvNGXYrB
         Dyz2Kn6jgW/oQWixVgn3Vi/nWdZRAWjI6AaXHULDE67AG2In20slTHzEwd9CaMUN7E+M
         Gz6X3S1molFlpPe/wAxI0tlVMLWp4AIWQqiIAJXOE/hxlnGKmDe5bLq+63YKGevsPiOj
         eRWa4KgIRDWw1FJnq2UE3avOGksQ2wFlQ5wE0mYNc97Yg56wLcONmSaqNz+kRMRz26Ko
         IC8Q==
X-Forwarded-Encrypted: i=1; AJvYcCW22nbghdUhOt7r600I24W2Cku90tPovIRWav3Kj9hG5yLc9+l1KJbaWFgheK2yXuruf+hpn7J6Kv4=@lists.infradead.org
X-Gm-Message-State: AOJu0YwrEcTHR803NpqXrmKO26SWYqsze4Hr+6gSupEzAfzsO53QRekK
	4PNVAbF0Fxehi88iXn2cAK+cgfv4+u9+9PGpGcFWp9DR9D0yLs0BTE8G8iGh6MYZmM8=
X-Gm-Gg: ASbGncu6wQN5wvYLRF5t7Vs7Fe3eX7fbrohkl8Garg9GplVBbvlzW87hzIXTa1GGE/J
	7JP26qAxX1DA/QHVjaBpYNVdnEL22gX9tCISguDqEyuVIXNIQ3LeR18jfqnTYJ7Irn2KBSxYb6o
	J9b1HGxrfrV58aOe+SuE30/EWi6QTY4eP/dZ+d0KrluhIvY85RiujptKfnCFpUZlUlDWqi+CwUP
	u/I3jCwI63UXwLGMFkZYWU9LWSwKc4gV7jox87X8NVKCJZ66VGD6WZCx20v8TZd+x5bd1dbDBcm
	bTdShAx/ntPoLLrSVlM9B2faw6BaRSGBzyePkg6ZGznCX8RomGZz
X-Google-Smtp-Source: AGHT+IH4SSMbmRg5K8o/IXBgX0ZJOEsXjczbFsjn2WjtC7mUPVoS61DQQViAkHrByQ5hjbixI+FQmw==
X-Received: by 2002:a05:6a00:9294:b0:740:6f6:7338 with SMTP id d2e1a72fcca58-745ecdc83c5mr3906723b3a.3.1747995764468;
        Fri, 23 May 2025 03:22:44 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a9829ce8sm12466688b3a.118.2025.05.23.03.22.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 03:22:43 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Shuah Khan <shuah@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Deepak Gupta <debug@rivosinc.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Atish Patra <atishp@rivosinc.com>
Subject: [PATCH v8 12/14] RISC-V: KVM: add SBI extension reset callback
Date: Fri, 23 May 2025 12:19:29 +0200
Message-ID: <20250523101932.1594077-13-cleger@rivosinc.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250523101932.1594077-1-cleger@rivosinc.com>
References: <20250523101932.1594077-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_112246_195666_E492847C 
X-CRM114-Status: GOOD (  17.63  )
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

Q3VycmVudGx5LCBvbmx5IHRoZSBTVEEgZXh0ZW5zaW9uIG5lZWRlZCBhIHJlc2V0IGZ1bmN0aW9u
IGJ1dCB0aGF0J3MKZ29pbmcgdG8gYmUgdGhlIGNhc2UgZm9yIEZXRlQgYXMgd2VsbC4gQWRkIGEg
cmVzZXQgY2FsbGJhY2sgdGhhdCBjYW4gYmUKaW1wbGVtZW50ZWQgYnkgU0JJIGV4dGVuc2lvbnMu
CgpTaWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBMw6lnZXIgPGNsZWdlckByaXZvc2luYy5jb20+ClJl
dmlld2VkLWJ5OiBBbmRyZXcgSm9uZXMgPGFqb25lc0B2ZW50YW5hbWljcm8uY29tPgpSZXZpZXdl
ZC1ieTogQXRpc2ggUGF0cmEgPGF0aXNocEByaXZvc2luYy5jb20+Ci0tLQogYXJjaC9yaXNjdi9p
bmNsdWRlL2FzbS9rdm1faG9zdC5oICAgICB8ICAxIC0KIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20v
a3ZtX3ZjcHVfc2JpLmggfCAgMiArKwogYXJjaC9yaXNjdi9rdm0vdmNwdS5jICAgICAgICAgICAg
ICAgICB8ICAyICstCiBhcmNoL3Jpc2N2L2t2bS92Y3B1X3NiaS5jICAgICAgICAgICAgIHwgMjQg
KysrKysrKysrKysrKysrKysrKysrKysrCiBhcmNoL3Jpc2N2L2t2bS92Y3B1X3NiaV9zdGEuYyAg
ICAgICAgIHwgIDMgKystCiA1IGZpbGVzIGNoYW5nZWQsIDI5IGluc2VydGlvbnMoKyksIDMgZGVs
ZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1faG9zdC5o
IGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1faG9zdC5oCmluZGV4IDBlOWMyZmFiNjM3OC4u
NGZhMDJlMDgyMTQyIDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV9ob3N0
LmgKKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1faG9zdC5oCkBAIC00MDcsNyArNDA3
LDYgQEAgdm9pZCBfX2t2bV9yaXNjdl92Y3B1X3Bvd2VyX29uKHN0cnVjdCBrdm1fdmNwdSAqdmNw
dSk7CiB2b2lkIGt2bV9yaXNjdl92Y3B1X3Bvd2VyX29uKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSk7
CiBib29sIGt2bV9yaXNjdl92Y3B1X3N0b3BwZWQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1KTsKIAot
dm9pZCBrdm1fcmlzY3ZfdmNwdV9zYmlfc3RhX3Jlc2V0KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSk7
CiB2b2lkIGt2bV9yaXNjdl92Y3B1X3JlY29yZF9zdGVhbF90aW1lKHN0cnVjdCBrdm1fdmNwdSAq
dmNwdSk7CiAKICNlbmRpZiAvKiBfX1JJU0NWX0tWTV9IT1NUX0hfXyAqLwpkaWZmIC0tZ2l0IGEv
YXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1fdmNwdV9zYmkuaCBiL2FyY2gvcmlzY3YvaW5jbHVk
ZS9hc20va3ZtX3ZjcHVfc2JpLmgKaW5kZXggYmNiOTA3NTdiMTQ5Li5jYjY4YjNhNTdjOGYgMTAw
NjQ0Ci0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20va3ZtX3ZjcHVfc2JpLmgKKysrIGIvYXJj
aC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1fdmNwdV9zYmkuaApAQCAtNTcsNiArNTcsNyBAQCBzdHJ1
Y3Qga3ZtX3ZjcHVfc2JpX2V4dGVuc2lvbiB7CiAJICovCiAJaW50ICgqaW5pdCkoc3RydWN0IGt2
bV92Y3B1ICp2Y3B1KTsKIAl2b2lkICgqZGVpbml0KShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpOwor
CXZvaWQgKCpyZXNldCkoc3RydWN0IGt2bV92Y3B1ICp2Y3B1KTsKIH07CiAKIHZvaWQga3ZtX3Jp
c2N2X3ZjcHVfc2JpX2ZvcndhcmQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCBzdHJ1Y3Qga3ZtX3J1
biAqcnVuKTsKQEAgLTc4LDYgKzc5LDcgQEAgYm9vbCByaXNjdl92Y3B1X3N1cHBvcnRzX3NiaV9l
eHQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCBpbnQgaWR4KTsKIGludCBrdm1fcmlzY3ZfdmNwdV9z
YmlfZWNhbGwoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCBzdHJ1Y3Qga3ZtX3J1biAqcnVuKTsKIHZv
aWQga3ZtX3Jpc2N2X3ZjcHVfc2JpX2luaXQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1KTsKIHZvaWQg
a3ZtX3Jpc2N2X3ZjcHVfc2JpX2RlaW5pdChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpOwordm9pZCBr
dm1fcmlzY3ZfdmNwdV9zYmlfcmVzZXQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1KTsKIAogaW50IGt2
bV9yaXNjdl92Y3B1X2dldF9yZWdfc2JpX3N0YShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIHVuc2ln
bmVkIGxvbmcgcmVnX251bSwKIAkJCQkgICB1bnNpZ25lZCBsb25nICpyZWdfdmFsKTsKZGlmZiAt
LWdpdCBhL2FyY2gvcmlzY3Yva3ZtL3ZjcHUuYyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHUuYwppbmRl
eCAyMjU5NzE3ZTNiODkuLmVjOWY0NDU0NWNlYSAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9rdm0v
dmNwdS5jCisrKyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHUuYwpAQCAtOTYsNyArOTYsNyBAQCBzdGF0
aWMgdm9pZCBrdm1fcmlzY3ZfcmVzZXRfdmNwdShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpCiAJdmNw
dS0+YXJjaC5oZmVuY2VfdGFpbCA9IDA7CiAJbWVtc2V0KHZjcHUtPmFyY2guaGZlbmNlX3F1ZXVl
LCAwLCBzaXplb2YodmNwdS0+YXJjaC5oZmVuY2VfcXVldWUpKTsKIAotCWt2bV9yaXNjdl92Y3B1
X3NiaV9zdGFfcmVzZXQodmNwdSk7CisJa3ZtX3Jpc2N2X3ZjcHVfc2JpX3Jlc2V0KHZjcHUpOwog
CiAJLyogUmVzZXQgdGhlIGd1ZXN0IENTUnMgZm9yIGhvdHBsdWcgdXNlY2FzZSAqLwogCWlmIChs
b2FkZWQpCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2t2bS92Y3B1X3NiaS5jIGIvYXJjaC9yaXNj
di9rdm0vdmNwdV9zYmkuYwppbmRleCAzMTM5ZjE3MWMyMGYuLjUwYmUwNzliNTUyOCAxMDA2NDQK
LS0tIGEvYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmkuYworKysgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1
X3NiaS5jCkBAIC01MzYsMyArNTM2LDI3IEBAIHZvaWQga3ZtX3Jpc2N2X3ZjcHVfc2JpX2RlaW5p
dChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpCiAJCWV4dC0+ZGVpbml0KHZjcHUpOwogCX0KIH0KKwor
dm9pZCBrdm1fcmlzY3ZfdmNwdV9zYmlfcmVzZXQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1KQorewor
CXN0cnVjdCBrdm1fdmNwdV9zYmlfY29udGV4dCAqc2NvbnRleHQgPSAmdmNwdS0+YXJjaC5zYmlf
Y29udGV4dDsKKwljb25zdCBzdHJ1Y3Qga3ZtX3Jpc2N2X3NiaV9leHRlbnNpb25fZW50cnkgKmVu
dHJ5OworCWNvbnN0IHN0cnVjdCBrdm1fdmNwdV9zYmlfZXh0ZW5zaW9uICpleHQ7CisJaW50IGlk
eCwgaTsKKworCWZvciAoaSA9IDA7IGkgPCBBUlJBWV9TSVpFKHNiaV9leHQpOyBpKyspIHsKKwkJ
ZW50cnkgPSAmc2JpX2V4dFtpXTsKKwkJZXh0ID0gZW50cnktPmV4dF9wdHI7CisJCWlkeCA9IGVu
dHJ5LT5leHRfaWR4OworCisJCWlmIChpZHggPCAwIHx8IGlkeCA+PSBBUlJBWV9TSVpFKHNjb250
ZXh0LT5leHRfc3RhdHVzKSkKKwkJCWNvbnRpbnVlOworCisJCWlmIChzY29udGV4dC0+ZXh0X3N0
YXR1c1tpZHhdICE9IEtWTV9SSVNDVl9TQklfRVhUX1NUQVRVU19FTkFCTEVEIHx8CisJCSAgICAh
ZXh0LT5yZXNldCkKKwkJCWNvbnRpbnVlOworCisJCWV4dC0+cmVzZXQodmNwdSk7CisJfQorfQor
CmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2t2bS92Y3B1X3NiaV9zdGEuYyBiL2FyY2gvcmlzY3Yv
a3ZtL3ZjcHVfc2JpX3N0YS5jCmluZGV4IDVmMzU0MjcxMTRjMS4uY2M2Y2I3YzhmMGU0IDEwMDY0
NAotLS0gYS9hcmNoL3Jpc2N2L2t2bS92Y3B1X3NiaV9zdGEuYworKysgYi9hcmNoL3Jpc2N2L2t2
bS92Y3B1X3NiaV9zdGEuYwpAQCAtMTYsNyArMTYsNyBAQAogI2luY2x1ZGUgPGFzbS9zYmkuaD4K
ICNpbmNsdWRlIDxhc20vdWFjY2Vzcy5oPgogCi12b2lkIGt2bV9yaXNjdl92Y3B1X3NiaV9zdGFf
cmVzZXQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1KQorc3RhdGljIHZvaWQga3ZtX3Jpc2N2X3ZjcHVf
c2JpX3N0YV9yZXNldChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpCiB7CiAJdmNwdS0+YXJjaC5zdGEu
c2htZW0gPSBJTlZBTElEX0dQQTsKIAl2Y3B1LT5hcmNoLnN0YS5sYXN0X3N0ZWFsID0gMDsKQEAg
LTE1Niw2ICsxNTYsNyBAQCBjb25zdCBzdHJ1Y3Qga3ZtX3ZjcHVfc2JpX2V4dGVuc2lvbiB2Y3B1
X3NiaV9leHRfc3RhID0gewogCS5leHRpZF9lbmQgPSBTQklfRVhUX1NUQSwKIAkuaGFuZGxlciA9
IGt2bV9zYmlfZXh0X3N0YV9oYW5kbGVyLAogCS5wcm9iZSA9IGt2bV9zYmlfZXh0X3N0YV9wcm9i
ZSwKKwkucmVzZXQgPSBrdm1fcmlzY3ZfdmNwdV9zYmlfc3RhX3Jlc2V0LAogfTsKIAogaW50IGt2
bV9yaXNjdl92Y3B1X2dldF9yZWdfc2JpX3N0YShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsCi0tIAoy
LjQ5LjAKCgotLSAKa3ZtLXJpc2N2IG1haWxpbmcgbGlzdAprdm0tcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2t2bS1y
aXNjdgo=
